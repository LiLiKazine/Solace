//
//  FilmButtonView.swift
//  Solace
//
//  Created by LiLi Kazine on 2019/3/30.
//  Copyright © 2019 LiLi Kazine. All rights reserved.
//

import UIKit

class FilmButtonView: UIView {
    
    var isOn = false {
        willSet {
            animate(newValue)
        }
    }
    let animDuration: Double = 0.4
    var outerLayer: CAShapeLayer!
    var innerLayer: CAShapeLayer!
    var squareLayer: CAShapeLayer!
    
    var circleRect: CGRect {
        return bounds.insetBy(dx: 12, dy: 12)
    }
    
    var squareRect: CGRect {
        return bounds.insetBy(dx: 26, dy: 26)
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        preset()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        preset()
    }
    
    private func preset() {
        isUserInteractionEnabled = true
        backgroundColor = .clear
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapped(_:)))
        addGestureRecognizer(tapGesture)
        
        outerLayer = CAShapeLayer()
        outerLayer.fillRule = .evenOdd
        outerLayer.fillColor = WHISPER.cgColor
        outerLayer.path = ringPath(in: bounds, width: 8).cgPath
        layer.addSublayer(outerLayer)
        innerLayer = CAShapeLayer()
        innerLayer.fillColor = RADICAL_RED.cgColor
        innerLayer.path = circlePath(in: bounds.insetBy(dx: 12, dy: 12)).cgPath
        innerLayer.frame = layer.bounds
        layer.addSublayer(innerLayer)
        squareLayer = CAShapeLayer()
        squareLayer.fillColor = RADICAL_RED.cgColor
        squareLayer.path = squarePath(in: squareRect).cgPath
        layer.addSublayer(squareLayer)
    }
    
    private func animate(_ on: Bool) {
        let animatePath = CABasicAnimation(keyPath: "transform")
        animatePath.duration = animDuration
        animatePath.fromValue = on ? CATransform3DMakeScale(1.0, 1.0, 1.0) : CATransform3DMakeScale(0.2, 0.2, 1.0)
        animatePath.toValue = on ? CATransform3DMakeScale(0.2, 0.2, 1.0) : CATransform3DMakeScale(1.0, 1.0, 1.0)
        animatePath.fillMode = .forwards
        animatePath.isRemovedOnCompletion = false
        innerLayer.add(animatePath, forKey: "transform")
    }
    

    @objc func tapped(_ gesture: UITapGestureRecognizer) {
        isOn.toggle()
    }
    
    
    func ringPath(in rect: CGRect, width: CGFloat) -> UIBezierPath {
        let outerRing = UIBezierPath(ovalIn: rect)
        let innerRing = UIBezierPath(ovalIn: rect.insetBy(dx: width, dy: width))
        let path = UIBezierPath()
        path.append(outerRing)
        path.append(innerRing)
        return path
    }
    
    func squarePath(in rect: CGRect) -> UIBezierPath {
        let path = UIBezierPath(roundedRect: rect, cornerRadius: 8.0)
        return path
    }
    
    func circlePath(in rect: CGRect) -> UIBezierPath {
        let path = UIBezierPath(ovalIn: rect)
        return path
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
