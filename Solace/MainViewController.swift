//
//  OperationViewController.swift
//  Solace
//
//  Created by LiLi Kazine on 2019/3/28.
//  Copyright © 2019 LiLi Kazine. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var menuItemContainer: UIView!
    @IBOutlet weak var contentContainer: UIView!
    var menuButton: MenuButtonView!
    
    var hideStatusBar: Bool = true
    var itemWidth: CGFloat {
        return menuItemContainer.bounds.width
    }
    let menuAnimDuration: CFTimeInterval = 0.7

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = WHISPER
        menuButton = MenuButtonView(frame: CGRect(x: 0, y: 0, width: 28, height: 24))
        menuButton.action = menuAction(expand:)
        menuButton.animate(0.0)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: menuButton)
        navigationController?.isNavigationBarHidden = true
        menuItemContainer.layer.anchorPoint.x = 1.0

        setMenu(0.0)
        
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        view.addGestureRecognizer(panGesture)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        startUpAnimation()
        
    }
    
    @objc func handlePan(_ recognizer: UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: view)
        print(translation)
    }
    
    func menuAction(expand: Bool) {
        let process: CGFloat = expand ? 1.0 : 0.0
        UIView.animate(withDuration: menuAnimDuration) {
            self.setMenu(process)
        }
    }
    
    func setMenu(_ percent: CGFloat) {
        contentContainer.frame.origin.x = itemWidth * percent
        menuItemContainer.layer.transform = menuItemsTransform(percent)
        menuItemContainer.alpha = max(0.2, percent)
    }
    
    func menuItemsTransform(_ percent: CGFloat) -> CATransform3D {
        var identity = CATransform3DIdentity
        identity.m34 = -1.0/500
        let remainingPercentage = 1 - percent
        let angle = remainingPercentage * π * -0.5
        let rotate = CATransform3DRotate(identity, angle, 0.0, 1.0, 0.0)
        let translate = CATransform3DMakeTranslation(itemWidth * percent, 0.0, 0.0)
        return CATransform3DConcat(rotate, translate)
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
