//
//  ViewController.swift
//  Project18iAdAndDebugging
//
//  Created by Henry on 7/16/15.
//  Copyright (c) 2015 Henry. All rights reserved.
//

import UIKit
import iAd

class ViewController: UIViewController, ADBannerViewDelegate {
    
    var bannerView: ADBannerView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //specify a regular banner type
        bannerView = ADBannerView(adType: .Banner)
        //we can add Auto Layout constraints ourselves
        bannerView.setTranslatesAutoresizingMaskIntoConstraints(false)
        //setting ourself as the delegate, we'll get told by iAd if a banner loaded or not
        bannerView.delegate = self
        //create the banner view and start it as hidden
        bannerView.hidden = true
        view.addSubview(bannerView)
        
        let viewsDictionary = ["bannerView": bannerView]
        //Those constraints will force the iAd banner to fill the full width of the screen and align to its bottom
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[bannerView]|", options: .allZeros, metrics: nil, views: viewsDictionary))
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[bannerView]|", options: .allZeros, metrics: nil, views: viewsDictionary))
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //tells us when we received an advert
    func bannerViewDidLoadAd(banner: ADBannerView!) {
        bannerView.hidden = false
    }
    
    //tells us when something went wrong
    func bannerView(banner: ADBannerView!, didFailToReceiveAdWithError error: NSError!) {
        bannerView.hidden = true
    }
    
}

