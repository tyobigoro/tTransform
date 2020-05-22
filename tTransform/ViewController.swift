//
//  ViewController.swift
//  tTransform
//
//  Created by tyobigoro on 2020/05/17.
//  Copyright © 2020 tyobigoro. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var menuView: UIView!
    
    var isVisible_menu: Bool = false {
        didSet {
            if oldValue != isVisible_menu {
                updateVisiblityOfMenuView()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnDidTap(_ sender: Any) {
        isVisible_menu.toggle()
    }
    
    func updateVisiblityOfMenuView() {
        let size = CGSize(width: self.view.bounds.width * 0.8, height: self.view.bounds.height)
        let visibleRect = CGRect(origin: .zero, size: size)
        let inVisibleOrigin = CGPoint(x: -size.width, y: 0)
        let inVisibleRect = CGRect(origin: inVisibleOrigin, size: size)
        
        if isVisible_menu {
            menuView.frame = inVisibleRect
            self.view.addSubview(menuView)
            
            UIView.animate(withDuration: 0.5, animations: {
                self.menuView.frame = visibleRect
            })
            return
        }
        
        if !isVisible_menu {
            
            UIView.animate(withDuration: 0.5, animations: {
                self.menuView.frame = inVisibleRect
            }, completion: { _ in
                self.menuView.removeFromSuperview()
            })
            return
        }
    }
    
}
