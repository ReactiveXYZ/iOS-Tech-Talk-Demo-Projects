//
//  ViewController.swift
//  demo3-make-simple-tableview
//
//  Created by Jackie Chung on 19/11/16.
//  Copyright © 2016 ReactiveXYZ. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let data:Array = ["Hi", "My", "Name", "is", "Jackie"];
    
    @IBOutlet weak var tv: UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /** 
     * UITableView delegate vs datasource
    **/
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.data.count;
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        if (tableViewCell != nil) {
            
            tableViewCell?.textLabel?.text = self.data[indexPath.row];
            
        }
        
        return tableViewCell!;
        
    }
    
    

}

