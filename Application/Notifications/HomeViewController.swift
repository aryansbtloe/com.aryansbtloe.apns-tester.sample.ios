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
        NotificationCenter.default.addObserver(forName: NSNotification.Name.init(rawValue: "PushNotificationTokenReceived"), object: nil, queue: .main) { (notification) in
            self.fetchAndCopyDeviceToken()
        }
    }
    
    @IBAction func fetchAndCopyDeviceToken(){
        if let deviceToken = UserDefaults.standard.string(forKey: "PushNotificationDeviceToken"){
            self.deviceTokenLabel.text = "Device Token\n\(deviceToken)"
            UIPasteboard.general.string = deviceToken
            showInterstitialAd()
        }
    }
    
    @IBAction func copyBundleIdentifier(){
        UIPasteboard.general.string = "com.aryansbtloe.apns-tester.sample.ios"
        showInterstitialAd()
    }
    
    @IBAction func downloadCertificate(){
        if let url = URL(string: "https://github.com/aryansbtloe/com.aryansbtloe.apns-tester.sample.ios/raw/master/Certificate/") {
            UIApplication.shared.openURL(url)
            showInterstitialAd()
        }
    }
    
}
