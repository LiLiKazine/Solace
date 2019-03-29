import UIKit

func hexColor(hex: String) -> UIColor {
    var copy = hex
    var start: String.Index {
        return copy.startIndex
    }
    if copy.starts(with: "#") {
        copy.remove(at: start)
    }
    let rangeR = start..<copy.index(start, offsetBy: 2)
    let rangeG = copy.index(after: rangeR.upperBound)..<copy.index(rangeR.upperBound, offsetBy: 2)
    let rangeB = copy.index(after: rangeG.upperBound)..<copy.endIndex
    guard let r = UInt8(String(copy[rangeR]), radix: 16),
        let g = UInt8(String(copy[rangeG]), radix: 16),
        let b = UInt8(String(copy[rangeB]), radix: 16) else { return .white }
    return UIColor(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: 1.0)
}
