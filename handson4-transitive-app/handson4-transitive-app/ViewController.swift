//
//  ViewController.swift
//  handson4-transitive-app
//
//  Created by Jackie Chung on 19/11/16.
//  Copyright © 2016 ReactiveXYZ. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var data:Array = ["dog","cat","GEEEENIUSSSS"];
    
    @IBOutlet weak var tv: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    /**
     * Tableview datasource and delegate
    **/
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        if (tableViewCell != nil) {
            
            tableViewCell?.textLabel?.text = self.data[indexPath.row];
            
        }
        
        return tableViewCell!
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.data.count;
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.performSegue(withIdentifier: "showDetail", sender: self.data[indexPath.row]);
        
    }
    
    /**
     * Segue performer
    **/
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showDetail" {
            
            let destinationVC = segue.destination as! DetailViewController;
            
            destinationVC.data = sender as! String;
            
        }
        
    }
    
    
}

