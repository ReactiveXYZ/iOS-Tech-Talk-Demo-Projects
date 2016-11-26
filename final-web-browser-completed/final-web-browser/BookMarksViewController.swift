//
//  BookMarksViewController.swift
//  final-web-browser
//
//  Created by Jackie Chung on 19/11/16.
//  Copyright © 2016 ReactiveXYZ. All rights reserved.
//

import UIKit

class BookMarksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    /**
     * DO NOT ALTER START
     **/
    
    @IBAction func dismissVC(_ sender: Any) {
        
        self.presentingViewController?.dismiss(animated: true, completion: {[unowned self] in
            
            self.reloadWebpage(url: self.selected);
            
        });
        
    }
    
    func reloadWebpage(url:String) -> Void {
        
        let userInfo:[String:String] = ["url": url];
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "webpage.reload"), object: nil, userInfo: userInfo);
        
    }
    
    /**
     * DO NOT ALTER END!
     **/
    
    // the selected bookmark url
    var selected:String = "";
    
    // all the bookmarks
    var bookmarks = Array<String>();
    
    
    @IBOutlet weak var tv: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    /**
     * Tableview delegates/data source
     **/
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.bookmarks.count;
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell");
        
        if (tableViewCell != nil) {
            
            tableViewCell?.textLabel?.text = self.bookmarks[indexPath.row];
            
        }
        
        return tableViewCell!;
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // READ: this is the method that is triggered when a tableview cell is clicked.
        let url = self.bookmarks[indexPath.row];
        
        self.selected = url;
        
        self.dismissVC(url as Any);
        
    }
    

   

}
