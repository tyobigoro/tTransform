//
//  ViewController.swift
//  tTransform
//
//  Created by tyobigoro on 2020/05/17.
//  Copyright © 2020 tyobigoro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    var inTransformation: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    func reverse() {
        if inTransformation { return }
        inTransformation = true
        
        let transform: CGAffineTransform = .init(scaleX: -1, y: -1)
        UIView.animate(withDuration: 0.5, animations: {
            self.view.transform = self.view.transform.isIdentity ? transform : .identity
        }, completion: { _ in
            self.inTransformation = false
        })
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        reverse()
        return true
    }
}
