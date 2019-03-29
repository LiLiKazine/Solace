//
//  OperationViewController.swift
//  Solace
//
//  Created by LiLi Kazine on 2019/3/28.
//  Copyright © 2019 LiLi Kazine. All rights reserved.
//

import UIKit

class OperationViewController: UIViewController {
    
    var hideStatusBar: Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = WHISPER
        let test = MenuButtonView(frame: CGRect(x: 0, y: 0, width: 28, height: 24))
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: test)
        navigationController?.isNavigationBarHidden = true
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        startUpAnimation()
        
    }
    

    
    func startUpAnimation() {
        UIView.animate(withDuration: 0.6, delay: 0.4, options: .curveEaseOut, animations: {
            self.navigationController?.isNavigationBarHidden = false
        }, completion: nil)
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
