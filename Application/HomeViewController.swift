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
    }
    
    @IBAction func fetchAndCopyDeviceToken(){
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            deviceTokenLabel.text = appDelegate.deviceToken
            if let deviceToken = appDelegate.deviceToken {
                UIPasteboard.general.string = deviceToken
            }
        }
    }
    
}
