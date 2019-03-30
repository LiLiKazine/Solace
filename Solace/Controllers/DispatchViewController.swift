//
//  DispatchViewController.swift
//  Solace
//
//  Created by LiLi Kazine on 2019/3/29.
//  Copyright © 2019 LiLi Kazine. All rights reserved.
//

import UIKit

class DispatchViewController: UIViewController {
    
    @IBOutlet weak var dispatchView: UIView!
    
    @IBOutlet weak var operationContainer: UIView!
    @IBOutlet weak var operationLeadingConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var cameraContainer: UIView!
    @IBOutlet weak var cameraLeadingConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var recorderContainer: UIView!
    @IBOutlet weak var recorderLeadingConstraint: NSLayoutConstraint!
    
    var cameraVC: CameraViewController?
    var operationVC: OperationViewController?
    
    var leadingConstraintForHide: CGFloat {
        return view.bounds.width
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dispatchView.backgroundColor = WHISPER
        
        if let camVC = cameraVC, let opVC = operationVC {
            camVC.delegate = opVC
        }
        
        operationLeadingConstraint.constant = 0
        cameraLeadingConstraint.constant = leadingConstraintForHide
        recorderLeadingConstraint.constant = leadingConstraintForHide
        view.layoutIfNeeded()
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let cameraVC = segue.destination as? CameraViewController {
            self.cameraVC = cameraVC
            
        }
        if let operationVC = segue.destination as? OperationViewController {
            self.operationVC = operationVC
        }
    }

}

extension DispatchViewController: MenuOptionProtocol {
    
    func optionSelected(kind: ItemKind) {
        
        dispatchView.bringSubviewToFront(findView(from: kind))
       
        adjust(for: kind, show: true)
        
        for val in ItemKind.all() {
            if val != kind {
                adjust(for: val, show: false)
            }
        }
    }
    
    func findConstraint(from kind: ItemKind) -> NSLayoutConstraint {
        switch kind {
        case .adjust:
            return operationLeadingConstraint
        case .camera:
            return cameraLeadingConstraint
        case .speaker:
            return recorderLeadingConstraint
        }
    }
    
    func findView(from kind: ItemKind) -> UIView {
        switch kind {
        case .adjust:
            return operationContainer
        case .camera:
            return cameraContainer
        case .speaker:
            return recorderContainer
        }
    }
    
    func adjust(for kind: ItemKind, show: Bool) {
        let constraint = findConstraint(from: kind)
        
        if show && constraint.constant != 0 {
            constraint.constant = 0
        }
        if !show && constraint.constant != leadingConstraintForHide {
            constraint.constant = leadingConstraintForHide
        }
        
        UIView.animate(withDuration: 0.7) {
            self.view.layoutIfNeeded()
        }
        
    }
    
}
