//
//  SnippetCollectionViewCell.swift
//  Solace
//
//  Created by LiLi Kazine on 2019/3/29.
//  Copyright © 2019 LiLi Kazine. All rights reserved.
//

import UIKit

class SnippetCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var bgImgView: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var durationLbl: UILabel!
    @IBOutlet weak var sizeLbl: UILabel!
    
    
    func setup(_ snippet: SnippetModel) {
        
        bgImgView.image = snippet.thumbnail
        nameLbl.text = snippet.name
        
    }
    
    override func awakeFromNib() {
        backgroundColor = CELLO
    }
}
