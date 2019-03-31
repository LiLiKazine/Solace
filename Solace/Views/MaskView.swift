//
//  MaskView.swift
//  Solace
//
//  Created by LiLi Kazine on 2019/3/31.
//  Copyright © 2019 LiLi Kazine. All rights reserved.
//

import UIKit

class MaskView: UIView {
    
    private let originFrame: CGRect
    
    var action: (()->Void)?
    
    override init(frame: CGRect) {
        originFrame = frame
        super.init(frame: frame)
        preset()
    }
    
    required init?(coder aDecoder: NSCoder) {
        originFrame = aDecoder.accessibilityFrame
        super.init(coder: aDecoder)
        preset()
    }
    
    func preset() {
        backgroundColor = UIColor.black.withAlphaComponent(0.6)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapped(_:)))
        addGestureRecognizer(tapGesture)
    }
    
    @objc func tapped(_ gesture: UITapGestureRecognizer) {
        shrink(in: 0.4)
        if let cb = action {
            cb()
        }
    }
    
    func expand(in seconds: Double) {
        guard let window = UIApplication.shared.keyWindow else { return }
        UIView.animate(withDuration: seconds) {
            self.frame = window.bounds
            self.layoutIfNeeded()
        }
    }
    
    func shrink(in seconds: Double) {
        UIView.animate(withDuration: seconds) {
            self.frame = self.originFrame
            self.layoutIfNeeded()
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
