//
//  SecondVC.swift
//  Delegate-Protocol
//
//  Created by apple on 11/8/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

class SecondVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btn1_Tapped(_ sender: Any) {
      let name = Notification.Name(rawValue: light_notKey)
    NotificationCenter.default.post(name: name, object: nil)
      dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btn2_Tapped(_ sender: Any) {
        let name = Notification.Name(rawValue: dark_notKey)
        NotificationCenter.default.post(name: name, object: nil)
        dismiss(animated: true, completion: nil)
    }
}
