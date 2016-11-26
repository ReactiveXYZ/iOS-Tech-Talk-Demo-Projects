//
//  ViewController.swift
//  final-web-browser
//
//  Created by Jackie Chung on 19/11/16.
//  Copyright © 2016 ReactiveXYZ. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {
    
    /**
     * IB Outlets / Views
     **/
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var addressText: UITextField!
    
    @IBOutlet weak var goBtn: UIButton!
    
    @IBOutlet weak var webView: UIWebView!
    
    @IBOutlet weak var backBtn: UIBarButtonItem!
    
    @IBOutlet weak var refreshBtn: UIBarButtonItem!
    
    @IBOutlet weak var addToBookMarkBtn: UIBarButtonItem!
    
    /**
     * Click events
     **/
    @IBAction func goBack(_ sender: Any) {
        
        self.webView.goBack();
        
    }
    
    /**
     * Data attributes
     **/
    var bookmarks = Array<String>();
    
    
    @IBAction func refresh(_ sender: Any) {
       
        self.webView.reload();
        
    }
    
    @IBAction func appendBookmark(_ sender: Any) {
       
        self.bookmarks.append(self.addressText.text!);
        
    }
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Setup code. DO NOT ALTER
        self.webView.delegate = self;
        self.loadWebpage("https://www.google.com")
        
        NotificationCenter.default.addObserver(self, selector: #selector(receivedReloadInstruction(notification:)), name: NSNotification.Name(rawValue: "webpage.reload"), object: nil)
        
    }
    
    @IBAction func loadWebpage(_ sender: Any) {
        
        self.addressText.resignFirstResponder();
        
        if sender is String {
            
            self.webView.loadRequest(URLRequest(url: URL(string: sender as! String)!))
            
            
        } else {
        
            
            if (self.addressText.text!.contains("http")) {
                
                self.webView.loadRequest(URLRequest(url: URL(string: self.addressText.text!)!))
                
            } else {
                
                self.webView.loadRequest(URLRequest(url: URL(string: "http://" + self.addressText.text!)!))
                
            }
            
        }
        
        
        
    }
    
    @objc private func receivedReloadInstruction(notification:NSNotification){
        
        let url = notification.userInfo?["url"];
        
        if (url != nil) {
            
            self.loadWebpage(url ?? "http://www.google.com");
            
        }
        
    }
    
    
    /**
     * DO NOT ALTER
     **/
    deinit {
        
        NotificationCenter.default.removeObserver(self);
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showBookMarks" {
            
            let destinationVC = segue.destination as! BookMarksViewController;
            
            destinationVC.bookmarks = self.bookmarks;
            
        }
        
    }
    
    
    /**
     * WebView delegate. 
     **/
    func webViewDidStartLoad(_ webView: UIWebView) {
        
        self.activityIndicator.isHidden = false;
        
        self.activityIndicator.startAnimating();
        
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        
        self.activityIndicator.isHidden = true;
        
        self.activityIndicator.stopAnimating();
        
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        self.addressText.text = (request.url?.absoluteString)!;
        
        return true;
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

