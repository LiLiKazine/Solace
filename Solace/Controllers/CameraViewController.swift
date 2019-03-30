//
//  CameraViewController.swift
//  Solace
//
//  Created by LiLi Kazine on 2019/3/29.
//  Copyright © 2019 LiLi Kazine. All rights reserved.
//

import UIKit
import AVFoundation
import Photos

class CameraViewController: UIViewController {
    
    lazy var photoLibrary = PHPhotoLibrary.shared()

    
    lazy var captureSession = AVCaptureSession()
    let movieOutput = AVCaptureMovieFileOutput()
    var previewLayer: AVCaptureVideoPreviewLayer!
    var activeInput: AVCaptureDeviceInput!
    
    var updateTimer: Timer!
    
    let camRatio: CGFloat = 16/9
    
    var filmBtn: FilmButtonView?
    var timeLbl: UILabel?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = RADICAL_RED
        
        if !checkAuthorization() {
            PHPhotoLibrary.requestAuthorization { status in
                if status != .authorized {
                    return
                }
            }
        }
        
        if setupSession() {
            setupPreview()
            startSession()
        }
    }
    
    func checkAuthorization() -> Bool {
        let status = PHPhotoLibrary.authorizationStatus()
        return status == .authorized
    }
    
    func setupSession() -> Bool {
        captureSession.sessionPreset = .high
        guard let camera = AVCaptureDevice.default(for: .video),
                let mic = AVCaptureDevice.default(for: .audio) else { return false }
        do {
            let camInput = try AVCaptureDeviceInput(device: camera)
            let micInput = try AVCaptureDeviceInput(device: mic)
            if captureSession.canAddInput(camInput) {
                captureSession.addInput(camInput)
                activeInput = camInput
            }
            if captureSession.canAddInput(micInput) {
                captureSession.addInput(micInput)
            }
            if captureSession.canAddOutput(movieOutput) {
                captureSession.addOutput(movieOutput)
            }
        } catch {
            print(error.localizedDescription)
            return false
        }
        return true
    }
    
    func setupPreview() {
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        let camWidth = view.bounds.width - 24
        let camHeight = camWidth * camRatio
        let frame = CGRect(x: 12, y: safeAreaTop()+44+8, width: camWidth, height: camHeight)
        previewLayer.frame = frame
        let roundCornerMask = CAShapeLayer()
        let roundedRectPath = UIBezierPath(roundedRect: CGRect(origin: .zero, size: frame.size), cornerRadius: 12.0)
        roundCornerMask.path = roundedRectPath.cgPath
        roundCornerMask.fillColor = UIColor.white.cgColor
        previewLayer.mask = roundCornerMask
        previewLayer.videoGravity = .resizeAspect
        view.layer.addSublayer(previewLayer)
    
        filmBtn = FilmButtonView(frame: CGRect(x: (frame.maxX + frame.minX)/2-42, y: frame.maxY - 90, width: 84, height: 84))
        filmBtn!.action = filmBtnAction
        view.addSubview(filmBtn!)
        
        let initialText = "00:00:00"
        let initialAttrText = NSAttributedString(string: initialText, attributes: [.foregroundColor: WHISPER,
                                                                                   .font: UIFont.systemFont(ofSize: 11)])
        let textSize = initialAttrText.size()
        
        timeLbl = UILabel(frame: CGRect(x: (frame.maxX + frame.minX - textSize.width)/2, y: frame.minY + 8, width: textSize.width + 8, height: textSize.height))
        timeLbl!.attributedText = initialAttrText
        timeLbl!.textAlignment = .center
        view.addSubview(timeLbl!)
        
    }
    
    func filmBtnAction() {
        if movieOutput.isRecording {
            endFilming()
        } else {
            startFilming()
        }
    }
    
    func startSession() {
        if !captureSession.isRunning {
            DispatchQueue.global().async {
                self.captureSession.startRunning()
            }
        }
    }
    
    func stopSession() {
        if captureSession.isRunning {
            DispatchQueue.global().async {
                self.captureSession.stopRunning()
            }
        }
    }
    
    func startTimer() {
        if let timer = updateTimer {
            timer.invalidate()
        }
        updateTimer = Timer(timeInterval: 0.5, target: self, selector: #selector(updateTimeDisplay), userInfo: nil, repeats: true)
        RunLoop.current.add(updateTimer, forMode: .common)
    }
    
    func resetTimer() {
        if let timer = updateTimer {
            timer.invalidate()
        }
        timeLbl?.attributedText = NSAttributedString(string: timeFormatter(time: UInt(0)), attributes: [.foregroundColor: WHISPER,
                                                                             .font: UIFont.systemFont(ofSize: 11)])
    }
    
    @objc func updateTimeDisplay() {
        let time = CMTimeGetSeconds(movieOutput.recordedDuration)
        let formattedTime = timeFormatter(time: UInt(time))
        timeLbl!.attributedText = NSAttributedString(string: formattedTime, attributes: [.foregroundColor: WHISPER,
                                                                                              .font: UIFont.systemFont(ofSize: 11)])
    }
    
    func currentVideoOrientation() -> AVCaptureVideoOrientation {
        var orientation: AVCaptureVideoOrientation
        
        switch UIDevice.current.orientation {
        case .portrait:
            orientation = AVCaptureVideoOrientation.portrait
        case .landscapeRight:
            orientation = AVCaptureVideoOrientation.landscapeLeft
        case .portraitUpsideDown:
            orientation = AVCaptureVideoOrientation.portraitUpsideDown
        default:
            orientation = AVCaptureVideoOrientation.landscapeRight
        }
        
        return orientation
    }
    
    func tempURL() -> URL? {
        let directory = NSTemporaryDirectory() as NSString
        let dateStr = Date().description
        if directory != "" {
            let path = directory.appendingPathComponent("\(dateStr).mov")
            return URL(fileURLWithPath: path)
        }
        
        return nil
    }
    
    func startFilming() {
        if !movieOutput.isRecording, let connection = movieOutput.connection(with: .video), let outputURL = tempURL() {
            if connection.isVideoOrientationSupported {
                connection.videoOrientation = currentVideoOrientation()
            }
            if connection.isVideoStabilizationSupported {
                connection.preferredVideoStabilizationMode = .auto
            }
            let device = activeInput.device
            if device.isSmoothAutoFocusSupported {
                do {
                    try device.lockForConfiguration()
                    device.isSmoothAutoFocusEnabled = true
                    device.unlockForConfiguration()
                } catch  {
                    print(error.localizedDescription)
                }
            }
            movieOutput.startRecording(to: outputURL, recordingDelegate: self)
        }
    }
    
    func endFilming() {
        if movieOutput.isRecording {
            movieOutput.stopRecording()
        }
    }
    
    func saveMovieToLibarary(url: URL) {
        
        photoLibrary.performChanges({
            PHAssetChangeRequest.creationRequestForAssetFromVideo(atFileURL: url)
        }) { (isSuccess, error) in
            if isSuccess {
                // Set thumbnail
//                self.setVideoThumbnailFromURL(movieURL: movieURL)
            } else {
                print("Error writing to photo library: \(error!.localizedDescription)")
            }
        }
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension CameraViewController: AVCaptureFileOutputRecordingDelegate {
    
    func fileOutput(_ output: AVCaptureFileOutput, didStartRecordingTo fileURL: URL, from connections: [AVCaptureConnection]) {
        filmBtn!.isOn = true
        startTimer()
    }
    
    func fileOutput(_ output: AVCaptureFileOutput, didFinishRecordingTo outputFileURL: URL, from connections: [AVCaptureConnection], error: Error?) {
        if let error = error {
            print(error.localizedDescription)
            return
        }
        saveMovieToLibarary(url: outputFileURL)
        filmBtn!.isOn = false
        resetTimer()
    }
    
    
}
