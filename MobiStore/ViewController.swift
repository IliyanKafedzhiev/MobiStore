//
//  ViewController.swift
//  MobiStore
//
//  Created by Iliyan Kafedzhiev on 6/22/15.
//  Copyright © 2015 MobiSystems. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var mainWebMobiView: UIWebView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let urlAddress = "https://www.mobisystems.com/featured/?iosApp=1"
        let url        = NSURL(string: urlAddress)
        let requestObj = NSURLRequest(URL: url!)
        
        self.mainWebMobiView.delegate = self
        self.mainWebMobiView.loadRequest(requestObj)
    }
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool
    {
        return true;
    }
    
    func webViewDidStartLoad(webView: UIWebView)
    {
        self.spinner.startAnimating()
    }
    func webViewDidFinishLoad(webView: UIWebView)
    {
        self.mainWebMobiView.hidden = false
        self.spinner.stopAnimating()
    }
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError)
    {
        self.mainWebMobiView.hidden = true;
    }
}

