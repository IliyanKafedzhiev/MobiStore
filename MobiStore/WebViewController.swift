//
//  WebViewController.swift
//  MobiStore
//
//  Created by Iliyan Kafedzhiev on 6/22/15.
//  Copyright © 2015 MobiSystems. All rights reserved.
//

import UIKit

class WebViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var mainWebMobiView: UIWebView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!

    @IBOutlet weak var backgroundImage: UIImageView!
    
    static let mobiAppStoreURL = "https://www.mobisystems.com/featured/?iosApp=1"
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.mainWebMobiView.delegate = self
        self.requestServer()
    }
    
    func requestServer()
    {
        let urlAddress = WebViewController.mobiAppStoreURL
        let url        = NSURL(string: urlAddress)
        let requestObj = NSURLRequest(URL: url!)
        
        self.mainWebMobiView.loadRequest(requestObj)
    }
    
    func informError(error :NSError )
    {
        let localizedDescription = error.localizedDescription;
        let alertView = UIAlertController(title: "MobiStore", message: localizedDescription, preferredStyle: UIAlertControllerStyle.Alert)
        
        alertView.addAction(UIAlertAction(title: "Retry", style: UIAlertActionStyle.Default, handler:  { action in
                self.requestServer()
            } ))
        
        self.presentViewController(alertView, animated: true, completion: nil)
    }
    
//  UIWebViewDelegate
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool
    {
        let mobiUrl = NSURL(string: WebViewController.mobiAppStoreURL)
        
        if mobiUrl?.host != request.URL?.host
        {
            UIApplication.sharedApplication().openURL(request.URL!)
            return false
        }
        
        return true;
    }
    
    func webViewDidStartLoad(webView: UIWebView)
    {
        self.spinner.startAnimating()
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
    }
    func webViewDidFinishLoad(webView: UIWebView)
    {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        self.mainWebMobiView.hidden = false
        self.spinner.stopAnimating()
        self.backgroundImage.removeFromSuperview()
    }
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError)
    {
        self.mainWebMobiView.hidden = true;
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        self.informError(error)
    }
}

