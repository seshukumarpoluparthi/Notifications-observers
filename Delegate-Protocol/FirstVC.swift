//
//  FirstVC.swift
//  Delegate-Protocol
//
//  Created by apple on 11/8/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit


let light_notKey = "seshu_light"
let dark_notKey = "seshu_dark"

class FirstVC: UIViewController {
    let light = Notification.Name(light_notKey)
    let dark = Notification.Name(dark_notKey)
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @IBOutlet weak var img_mainImageview: UIImageView!
    @IBOutlet weak var lbl_Name: UILabel!
    @IBOutlet weak var btnlbl_choose: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnlbl_choose.layer.cornerRadius = btnlbl_choose.layer.frame.size.height/2
        createObservers()
    }
    
    func createObservers()  {
        NotificationCenter.default.addObserver(self, selector: #selector(FirstVC.updateImage(notification:)), name: light, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(FirstVC.updateImage(notification:)), name: dark, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(FirstVC.updateColor(notification:)), name: light, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(FirstVC.updateColor(notification:)), name: dark, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(FirstVC.updateNmae(notification:)), name: light, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(FirstVC.updateNmae(notification:)), name: dark, object: nil)
    }
    
    @IBAction func btn_chooseTapped(_ sender: Any) {
        let selectvc = storyboard?.instantiateViewController(withIdentifier: "SecondVC") as! SecondVC
        present(selectvc, animated: true, completion: nil)
    }
    
    
    @objc func updateImage(notification : NSNotification){
        let islight = notification.name == light
        let image = islight ? UIImage(named: "vader")! :             UIImage(named: "luke")!
        img_mainImageview.image = image
    }
    @objc func updateNmae(notification : NSNotification)  {
        let islight = notification.name == light
        let name = islight ? "Luke Skywalker" : "Darth Vader"
        lbl_Name.text = name
    }
    @objc func updateColor(notification : NSNotification)  {
        let islight = notification.name == light
        let color = islight ? UIColor.red : UIColor.cyan
        view.backgroundColor = color
    }
}
