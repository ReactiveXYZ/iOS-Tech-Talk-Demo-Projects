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
       
        // TODO: 
        // Find a method on our webview that
        // allows us to refresh the webpage
        // hint: the method name starts with "re"
        
    }
    
    @IBAction func appendBookmark(_ sender: Any) {
       
        // TODO:
        // Append our current webpage url to the bookmarks array
        // 1. Get the text of our addressText
        // 2. Append the text into self.bookmarks
        
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
     * Segue and destructor
     **/
    deinit {
        
        NotificationCenter.default.removeObserver(self);
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showBookMarks" {
            
            let destinationVC = segue.destination as! BookMarksViewController;
            
            // TODO:
            // Pass the bookmarks data to the destination
            // hint: destinationVC.SOMETHING = self.SOMETHING.
            
        }
        
    }
    
    
    /**
     * WebView delegate. 
     * DO NOT ALTER
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

