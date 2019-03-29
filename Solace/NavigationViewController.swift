//
//  NavigationViewController.swift
//  Solace
//
//  Created by LiLi Kazine on 2019/3/28.
//  Copyright © 2019 LiLi Kazine. All rights reserved.
//

import UIKit

class NavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.isTranslucent = true
        navigationBar.barTintColor = MIDNIGHT_EXPRESS
        navigationBar.topItem?.title = "Solace"
        navigationBar.titleTextAttributes = [.foregroundColor: WHISPER,
                                             .font: UIFont.systemFont(ofSize: 27, weight: .bold)]
    }
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
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
