//
//  VideoPlayer.swift
//  Solace
//
//  Created by LiLi Kazine on 2019/3/31.
//  Copyright © 2019 LiLi Kazine. All rights reserved.
//

import UIKit
import AVFoundation

class VideoPlayerView: UIView {
    
    var thumbnail: UIImage? {
        willSet {
            if newValue == nil {
                subviews.forEach { view in
                    if let view = view as? UIImageView {
                        view.removeFromSuperview()
                    }
                }
            }
            let imgView = UIImageView(image: newValue)
            imgView.contentMode = .scaleAspectFill
            self.addSubview(imgView)
            imgView.translatesAutoresizingMaskIntoConstraints = false
            let topConstraint = NSLayoutConstraint(item: imgView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0)
            let leadingConstraint = NSLayoutConstraint(item: imgView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 0)
            let trailingConstraint = NSLayoutConstraint(item: imgView, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1.0, constant: 0)
            let bottomConstraint = NSLayoutConstraint(item: imgView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0)
            self.addConstraints([topConstraint, leadingConstraint, trailingConstraint, bottomConstraint])
        }
    }
    
    override class var layerClass: AnyClass {
        return AVPlayerLayer.self
    }
    
    var playerLayer: AVPlayerLayer {
        return layer as! AVPlayerLayer
    }
    
    var player: AVPlayer? {
        get {
            return playerLayer.player
        }
        set {
            playerLayer.player = newValue
        }
    }
    
    func play() {
        if let player = player {
            thumbnail = nil
            player.play()
        }
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
