//
//  ViewController.swift
//  MobiStore
//
//  Created by Iliyan Kafedzhiev on 6/22/15.
//  Copyright © 2015 MobiSystems. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainWebMobiView: UIWebView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let urlAddress = "https://www.mobisystems.com/featured/"
        let url        = NSURL(string: urlAddress)
        let requestObj = NSURLRequest(URL: url!)
        
        self.mainWebMobiView.loadRequest(requestObj)
    }
}

