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
        #if DEBUG
        self.deviceTokenLabel.text = "Device Token\n 63318d5e369eb008e4c34a2101078b8685cd60527e573fdc29f44b83cfc9520d"
        #endif
    }
    
    @IBAction func fetchAndCopyDeviceToken(){
        AppDelegate.registerForPushNotifications {[weak self] (granted, error) in
            guard let `self` = self else {return}
            if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
                if let deviceToken = appDelegate.deviceToken {
                    self.deviceTokenLabel.text = "Device Token\n\(deviceToken)"
                    UIPasteboard.general.string = deviceToken
                    self.showAdd()
                }
            }
        }
    }
    
    @IBAction func copyBundleIdentifier(){
        UIPasteboard.general.string = "com.aryansbtloe.apns-tester.sample.ios"
        self.showAdd()
    }
    
    @IBAction func downloadCertificate(){
        if let url = URL(string: "https://github.com/aryansbtloe/com.aryansbtloe.apns-tester.sample.ios/raw/master/Certificate/") {
            UIApplication.shared.openURL(url)
            self.showAdd()
        }
    }
    
}
