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
    var isMenuOpen: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = WHISPER
        menuButton = MenuButtonView(frame: CGRect(x: 0, y: 0, width: 28, height: 24))
        menuButton.action = menuAction
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
        let translationX = recognizer.translation(in: view).x
        var progress = translationX / itemWidth * (isMenuOpen ? -1.0 : 1.0)
        progress = min(1.0, max(0.0, progress))

        switch recognizer.state {
        case .began:
            let shouldClose = floor(contentContainer.frame.origin.x/itemWidth)
            isMenuOpen = shouldClose == 1.0
        case .changed:
            setMenu(isMenuOpen ? (1-progress) : progress)
        case .ended: fallthrough
        case .cancelled: fallthrough
        case .failed:
            var targetProgress: CGFloat
            if isMenuOpen {
                targetProgress = progress < 0.5 ? 1.0 : 0.0
            } else {
                targetProgress = progress < 0.5 ? 0.0 : 1.0
            }

            UIView.animate(withDuration: menuAnimDuration * Double(1 - progress)) {
                self.setMenu(targetProgress)
            }

        default:
            break
        }
        
    }
    
    func menuAction() {
        let shouldClose = floor(contentContainer.frame.origin.x/itemWidth)
        let process: CGFloat = shouldClose == 1.0 ? 0.0: 1.0
        UIView.animate(withDuration: menuAnimDuration, animations: {
            self.setMenu(process)
        }) { _ in
            self.isMenuOpen = process == 1.0
        }
        
    }
    
    func setMenu(_ percent: CGFloat) {
        contentContainer.frame.origin.x = itemWidth * percent
        menuItemContainer.layer.transform = menuItemsTransform(percent)
        menuItemContainer.alpha = max(0.2, percent)
        menuButton.animate(percent)
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
