//
//  DispatchViewController.swift
//  Solace
//
//  Created by LiLi Kazine on 2019/3/29.
//  Copyright © 2019 LiLi Kazine. All rights reserved.
//

import UIKit

class DispatchViewController: UIViewController {
    @IBOutlet weak var operationContainer: UIView!
    @IBOutlet weak var operationLeadingConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var cameraContainer: UIView!
    @IBOutlet weak var cameraLeadingConstraint: NSLayoutConstraint!
    
    var cameraVC: CameraViewController?
    var operationVC: OperationViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let camVC = cameraVC, let opVC = operationVC as? AddVideoSnippetProtocol {
            camVC.delegate = opVC
        }
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
