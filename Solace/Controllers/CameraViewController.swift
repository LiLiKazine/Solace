//
//  CameraViewController.swift
//  Solace
//
//  Created by LiLi Kazine on 2019/3/29.
//  Copyright © 2019 LiLi Kazine. All rights reserved.
//

import UIKit
import AVFoundation

class CameraViewController: UIViewController {
    
    lazy var captureSession = AVCaptureSession()
    let movieOutput = AVCaptureMovieFileOutput()
    var previewLayer: AVCaptureVideoPreviewLayer!
    var activeInput: AVCaptureDeviceInput!
    
    var updateTimer: Timer!
    
    let camRatio: CGFloat = 16/9

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = RADICAL_RED
        
        if setupSession() {
            setupPreview()
            startSession()
        }
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
        let roundedRectPath = UIBezierPath(roundedRect: CGRect(origin: .zero, size: frame.size), byRoundingCorners: .allCorners, cornerRadii: CGSize(width: 12.0, height: 12.0))
        roundCornerMask.path = roundedRectPath.cgPath
        roundCornerMask.fillColor = UIColor.white.cgColor
        previewLayer.mask = roundCornerMask
        previewLayer.videoGravity = .resizeAspect
        view.layer.addSublayer(previewLayer)
    
    }
    
    func startSession() {
        if !captureSession.isRunning {
            DispatchQueue.global().async {
                self.captureSession.startRunning()
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
