//
//  ColorPresets.swift
//  Solace
//
//  Created by LiLi Kazine on 2019/3/28.
//  Copyright © 2019 LiLi Kazine. All rights reserved.
//

import UIKit

// Helper
func hexColor(_ hex: String) -> UIColor {
    var copy = hex
    var start: String.Index {
        return copy.startIndex
    }
    if copy.starts(with: "#") {
        copy.remove(at: start)
    }
    let rangeR = start..<copy.index(start, offsetBy: 2)
    let rangeG = rangeR.upperBound..<copy.index(rangeR.upperBound, offsetBy: 2)
    let rangeB = rangeG.upperBound..<copy.endIndex
    guard let r = UInt8(String(copy[rangeR]), radix: 16),
        let g = UInt8(String(copy[rangeG]), radix: 16),
        let b = UInt8(String(copy[rangeB]), radix: 16) else { return .white }
    return UIColor(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: 1.0)
}


// Color presets
let TURQUOISE_DARK = hexColor("08d9d6")
let MIDNIGHT_EXPRESS = hexColor("252a34")
let RADICAL_RED = hexColor("ff2e63")
let WHISPER = hexColor("eaeaea")
let CELLO = hexColor("364f6b")
let VIS_VIS = hexColor("fcf38a")
let BILOBA_FLOWER = hexColor("aa96da")




