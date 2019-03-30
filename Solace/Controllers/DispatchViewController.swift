//
//  DispatchViewController.swift
//  Solace
//
//  Created by LiLi Kazine on 2019/3/29.
//  Copyright © 2019 LiLi Kazine. All rights reserved.
//

import UIKit

protocol ControllerDispatchProtocol {
    func controllerWillHide()
    func controllerWillShow()
}

class DispatchViewController: UIViewController {
    
    @IBOutlet weak var dispatchView: UIView!
    
    @IBOutlet weak var operationContainer: UIView!
    @IBOutlet weak var operationLeadingConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var cameraContainer: UIView!
    @IBOutlet weak var cameraLeadingConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var recorderContainer: UIView!
    @IBOutlet weak var recorderLeadingConstraint: NSLayoutConstraint!
    
    var cameraVC: CameraViewController!
    var operationVC: OperationViewController!
    var recorderVC: RecorderViewController!
    
    var delegateOpration: ControllerDispatchProtocol?
    var delegateCamera: ControllerDispatchProtocol?
    var delegateRecorder: ControllerDispatchProtocol?

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
        if let operationVC = segue.destination as? OperationViewController {
            self.operationVC = operationVC
            delegateOpration = operationVC
        }
        if let cameraVC = segue.destination as? CameraViewController {
            self.cameraVC = cameraVC
            delegateCamera = cameraVC
        }
        if let recorderVC = segue.destination as? RecorderViewController {
            self.recorderVC = recorderVC
            delegateRecorder = recorderVC
        }
    }

}

extension DispatchViewController: MenuOptionProtocol {
    
    
    // delegate function
    func optionSelected(kind: ItemKind) {
        
        find(from: kind).delegate?.controllerWillShow()
        
        dispatchView.bringSubviewToFront(find(from: kind).container)
       
        adjust(for: kind, show: true)
        
        for val in ItemKind.all() {
            if val != kind {
                adjust(for: val, show: false)
                find(from: val).delegate?.controllerWillHide()
            }
        }
    }
    
    func find(from kind: ItemKind) -> (delegate: ControllerDispatchProtocol?, container: UIView, constrint: NSLayoutConstraint) {
        switch kind {
        case .adjust:
            return (delegateOpration, operationContainer, operationLeadingConstraint)
        case .camera:
            return (delegateCamera, cameraContainer, cameraLeadingConstraint)
        case .speaker:
            return (delegateRecorder,recorderContainer, recorderLeadingConstraint)
        }
    }
    
    func adjust(for kind: ItemKind, show: Bool) {
        let constraint = find(from: kind).constrint
        
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
