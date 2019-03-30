import UIKit

func tempURL() -> URL? {
    let directory = NSTemporaryDirectory() as NSString
    let dateStr = Date().description
    if directory != "" {
        let path = directory.appendingPathComponent("\(dateStr).mov")
        return URL(fileURLWithPath: path)
    }
    
    return nil
}

tempURL()
