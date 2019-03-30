//
//  MenuViewController.swift
//  Solace
//
//  Created by LiLi Kazine on 2019/3/29.
//  Copyright © 2019 LiLi Kazine. All rights reserved.
//

import UIKit

protocol MenuOptionProtocol {
    func optionSelected(kind: ItemKind)
}

class MenuViewController: UIViewController {

    @IBOutlet weak var itemAdjust: MenuItemView!
    @IBOutlet weak var itemCamera: MenuItemView!
    @IBOutlet weak var itemSpeaker: MenuItemView!
    
    var delegate: MenuOptionProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        itemAdjust.action = { [weak self] in  self?.action(kind: .adjust) }
        itemCamera.action = { [weak self] in  self?.action(kind: .camera) }
        itemSpeaker.action = { [weak self] in  self?.action(kind: .speaker) }

    }
    
    func action(kind: ItemKind) {
        if let delegate = delegate {
            delegate.optionSelected(kind: kind)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
