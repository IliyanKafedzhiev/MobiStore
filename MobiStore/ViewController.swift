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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let urlAddress = "http://www.google.com"
        let url = NSURL(string: urlAddress)
        let requestObj = NSURLRequest(URL: url!)
        self.mainWebMobiView.loadRequest(requestObj)
    }
}

