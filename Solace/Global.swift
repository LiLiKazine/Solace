//
//  Global.swift
//  Solace
//
//  Created by LiLi Kazine on 2019/3/29.
//  Copyright © 2019 LiLi Kazine. All rights reserved.
//

import UIKit


let π = CGFloat.pi

func safeAreaTop() -> CGFloat {
    var topMargin: CGFloat = 20.0
    if #available(iOS 11.0, *) {
        let window = UIApplication.shared.keyWindow
        topMargin = window?.safeAreaInsets.top ?? 20.0
    }
    return topMargin
}

func timeFormatter(time: UInt) -> String {
    let hours = time / 3600
    let minutes = (time / 60) % 60
    let seconds = time % 60
    
    return String(format: "%02i:%02i:%02i", arguments: [hours, minutes, seconds])
}
