//
//  MenuButtonView.swift
//  Solace
//
//  Created by LiLi Kazine on 2019/3/28.
//  Copyright © 2019 LiLi Kazine. All rights reserved.
//

import UIKit

enum LinePosition {
    case top
    case middle
    case bottom
}

class MenuButtonView: UIView {
    
    let strokeColor = WHISPER
    let animDuration: CFTimeInterval = 0.4
    
    func path(for position: LinePosition) -> UIBezierPath {
        let origin = bounds.origin
        let size = bounds.size
        let lineWidth = size.height / 10
        let line = UIBezierPath()
        switch position {
        case .top:
            line.move(to: CGPoint(x: origin.x, y: origin.y + lineWidth / 2))
            line.addLine(to: CGPoint(x: origin.x + size.width, y: origin.y + lineWidth / 2))
        case .middle:
            line.move(to: CGPoint(x: origin.x, y: origin.y + size.height / 2))
            line.addLine(to: CGPoint(x: origin.x + size.width, y: origin.y + size.height / 2))
        case .bottom:
            line.move(to: CGPoint(x: origin.x, y: origin.y + size.height - lineWidth / 2))
            line.addLine(to: CGPoint(x: origin.x + size.width, y: origin.y + size.height - lineWidth / 2))
        }
        return line
    }
    
    func layer(for position: LinePosition) -> CAShapeLayer {
        let layer = CAShapeLayer()
        let _path = path(for: position).cgPath
        layer.path = _path
        layer.strokeColor = strokeColor.cgColor
        layer.lineWidth = bounds.height / 10
        layer.bounds = _path.boundingBox
        switch position {
        case .top:
            layer.position = CGPoint(x: bounds.width / 2, y: bounds.height / 20)
        case .middle:
            layer.position = CGPoint(x: bounds.width / 2, y: bounds.height / 2)
        case .bottom:
            layer.position = CGPoint(x: bounds.width / 2, y: bounds.height * 0.95)
        }
        return layer
    }

    
    private func generateIcon(_ context: CGContext, rect: CGRect) {
        let top = path(for: .top).cgPath
        let middle = path(for: .middle).cgPath
        let bottom = path(for: .bottom).cgPath
       
        context.addPath(top)
        context.addPath(middle)
        context.addPath(bottom)
        context.setStrokeColor(strokeColor.cgColor)
        context.setLineWidth(rect.height / 10)
        context.strokePath()
    }
    
    // rotate and trnaslate
    lazy var roslate = { [weak self] (flag: Bool) -> CABasicAnimation in
        guard let self  = self else { return CABasicAnimation()  }
        let factor: CGFloat = flag ? 1.0 : -1.0
        let rotationAnim = CABasicAnimation(keyPath: "transform")
        let identity = CATransform3DIdentity
        rotationAnim.fromValue = identity
        let rotate = CATransform3DRotate(identity,  factor * π * 0.25, 0.0, 0.0, 1.0)
        let translate = CATransform3DTranslate(identity, 0.0, (factor * self.bounds.height - factor * self.bounds.height * 0.05) / 2, 0.0)
        let concat = CATransform3DConcat(rotate, translate)
        rotationAnim.toValue = concat
        rotationAnim.duration = self.animDuration
        rotationAnim.fillMode = .forwards
        rotationAnim.isRemovedOnCompletion = false
        return rotationAnim
    }
    
    lazy var scale: CABasicAnimation = {
        let scaleAnim = CABasicAnimation(keyPath: "transform")
        let identity = CATransform3DIdentity
        scaleAnim.fromValue = identity
        scaleAnim.toValue = CATransform3DScale(identity, 0.1, 1.0, 1.0)
        scaleAnim.duration = animDuration
        scaleAnim.fillMode = .forwards
        scaleAnim.isRemovedOnCompletion = false
        return scaleAnim
    }()
    
    private var expanded = false
    
    var isExpanded: Bool {
        return expanded
    }
    
    private var top: CAShapeLayer!
    private var middle: CAShapeLayer!
    private var bottom: CAShapeLayer!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        presets()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        presets()
    }
    
    private func presets() {
        top = layer(for: .top)
        middle = layer(for: .middle)
        bottom = layer(for: .bottom)
        layer.addSublayer(top)
        layer.addSublayer(middle)
        layer.addSublayer(bottom)
        backgroundColor = .clear
        isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapped(_:)))
        addGestureRecognizer(tapGesture)
    }
    
    @objc private func tapped(_ sender: UITapGestureRecognizer) {
        if !expanded {
            top.add(roslate(true), forKey: "expand")
            middle.add(scale, forKey: "expand")
            bottom.add(roslate(false), forKey: "expand")
        } else {
            let restoreAnim = CABasicAnimation(keyPath: "transform")
            restoreAnim.toValue = CATransform3DIdentity
            restoreAnim.duration = animDuration
            restoreAnim.fillMode = .forwards
            restoreAnim.isRemovedOnCompletion = false
            top.add(restoreAnim, forKey: "restore")
            middle.add(restoreAnim, forKey: "restore")
            bottom.add(restoreAnim, forKey: "restore")
        }
        
        expanded.toggle()
        
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
//    override func draw(_ rect: CGRect) {
//        let context = UIGraphicsGetCurrentContext()!
//        generateIcon(context, rect: rect)
//    }

}
