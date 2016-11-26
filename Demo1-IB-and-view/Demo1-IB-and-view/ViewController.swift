//
//  ViewController.swift
//  Demo1-IB-and-view
//
//  Created by Jackie Chung on 19/11/16.
//  Copyright © 2016 ReactiveXYZ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var alertBtn: UIButton!
    
    
    @IBAction func alertMe(_ sender: Any) {
        
        let alertView = UIAlertController(title: "Hey", message: "I'm alerting you!", preferredStyle: .alert);
        
        let dismissAction = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil);
        
        alertView.addAction(dismissAction);
        
        self.show(alertView, sender: nil);
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set border for alertBtn
        self.alertBtn.layer.borderColor = UIColor(colorLiteralRed: 0, green: 0, blue: 0, alpha: 1.0).cgColor;
        
        self.alertBtn.layer.cornerRadius = 10.0;
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

