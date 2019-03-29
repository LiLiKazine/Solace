//
//  MenuItemView.swift
//  Solace
//
//  Created by LiLi Kazine on 2019/3/29.
//  Copyright © 2019 LiLi Kazine. All rights reserved.
//

import UIKit

enum ItemKind: Int {
    case adjust = 0
    case camera
    case speaker
}

@IBDesignable
class MenuItemView: UIView {
    
    var itemKind: ItemKind? {
        didSet {
            setNeedsDisplay()
        }
    }
        
    @IBInspectable
    var kind: Int {
        didSet {
            if let newKind = ItemKind(rawValue: kind) {
                itemKind = newKind
            } else {
                itemKind = .adjust
            }
        }
    }
    
    init(of kind: ItemKind, frame: CGRect) {
        self.kind = kind.rawValue
        super.init(frame: frame)

    }
    
    required init?(coder aDecoder: NSCoder) {
        kind = 0
        super.init(coder: aDecoder)
    }

    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        guard let itemKind = itemKind else {return}
        var path: UIBezierPath?
        var color: UIColor?
        switch itemKind {
        case .adjust:
            path = drawAdjust()
            color = CELLO
        case .camera:
            path = drawCamera()
            color = RADICAL_RED
        case .speaker:
            path = drawSpeaker()
            color = BILOBA_FLOWER
        }
        let context = UIGraphicsGetCurrentContext()!
        context.setFillColor(color!.cgColor)
        context.fill(rect)
        context.setFillColor(WHISPER.cgColor)
        context.addPath(path!.cgPath)
        context.fillPath()
    }
    
}
