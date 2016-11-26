//
//  ViewController.swift
//  Handson2-modify-view-explore-components
//
//  Created by Jackie Chung on 19/11/16.
//  Copyright © 2016 ReactiveXYZ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    
    @IBOutlet weak var myBtn: UIButton!
    
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func changetext(_ sender: Any) {
        
        self.myLabel.text = self.textField.text;
        
        self.myLabel.textColor = UIColor(colorLiteralRed: 255, green: 0, blue: 0, alpha: 1.0);
        
    }
    
    @IBOutlet weak var trumpImage: UIImageView!

    @IBOutlet weak var smallifyBtn: UIButton!
    
    
    @IBAction func smallify(_ sender: Any) {
        
        self.trumpImage.image = #imageLiteral(resourceName: "trump-small-hands");
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

