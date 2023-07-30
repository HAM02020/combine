//
//  ViewController.swift
//  aaa
//
//  Created by my on 2023/7/28.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let btn = UIButton(type:.system)
        btn.setTitle("test", for: .normal)
        btn.center = view.center
        view.addSubview(btn)
        
    }
    
    
}
