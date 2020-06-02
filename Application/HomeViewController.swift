//
//  HomeViewController.swift
//  Application
//
//  Created by Alok Singh on 6/2/20.
//  Copyright © 2020 Alok Singh. All rights reserved.
//

import Foundation
import UIKit

class HomeViewController:BaseViewController {
    
    @IBOutlet private var deviceTokenLabel:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchAndCopyDeviceToken()
    }
    
    @IBAction func fetchAndCopyDeviceToken(){
        AppDelegate.registerForPushNotifications {[weak self] (granted, error) in
            guard let `self` = self else {return}
            if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
                self.deviceTokenLabel.text = "Device Token\n\(appDelegate.deviceToken)"
                if let deviceToken = appDelegate.deviceToken {
                    UIPasteboard.general.string = deviceToken
                    self.showAdd()
                }
            }
        }
    }
    
    @IBAction func copyBundleIdentifier(){
        UIPasteboard.general.string = "com.aryansbtloe.apns-tester.sample.ios"
    }
    
    @IBAction func downloadCertificate(){
        if let url = URL(string: "") {
            UIApplication.shared.openURL(url)
        }
    }
    
}
