//
//  DetailViewController.swift
//  handson4-transitive-app
//
//  Created by Jackie Chung on 19/11/16.
//  Copyright © 2016 ReactiveXYZ. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    public var data:String = "";
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set the title bar title
        self.title = data;
        
        // set image
        self.setImage();
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    private func setImage() -> Void{
    
        switch self.data {
        case "cat":
            self.imageView.image = #imageLiteral(resourceName: "cat");
            break;
        case "dog":
            self.imageView.image = #imageLiteral(resourceName: "dog");
            break;
        case "GEEEENIUSSSS":
            self.imageView.image = #imageLiteral(resourceName: "trump-genius");
            break;
        default:
            break;
        }
        
    }

}
