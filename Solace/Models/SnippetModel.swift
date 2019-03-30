//
//  SnippetModel.swift
//  Solace
//
//  Created by LiLi Kazine on 2019/3/29.
//  Copyright © 2019 LiLi Kazine. All rights reserved.
//

import UIKit

enum SnippetType: Int {
    case audio = 0
    case video
}

class SnippetModel {
    
    var name: String
    var url: URL
    var type: SnippetType
    var thumbnail: UIImage
    
    init(name: String, url: URL, type: SnippetType, thumbnail: UIImage) {
        self.name = name
        self.url = url
        self.type = type
        self.thumbnail = thumbnail
    }
    
}
