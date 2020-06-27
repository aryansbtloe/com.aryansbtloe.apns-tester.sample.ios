//
//  NeedHelpViewController.swift
//  Application
//
//  Created by Alok Singh on 4/17/20.
//  Copyright © 2020 Alok Singh. All rights reserved.
//

import UIKit
import MessageUI
/// <#Description#>
class NeedHelpViewController : BaseViewController , MFMailComposeViewControllerDelegate , MFMessageComposeViewControllerDelegate {
    
    @IBOutlet private weak var removeAdsButton:UIButton!

    /// <#Description#>
    override internal func viewDidLoad() {
        super.viewDidLoad()
        startUpInitialisations()
        setupForNavigationBar()
        registerForNotifications()
        updateUserInterfaceOnScreen()
    }
    
    /// <#Description#>
    internal func startUpInitialisations(){

    }
    /// <#Description#>
    internal func setupForNavigationBar(){
    }
    
    /// <#Description#>
    internal func registerForNotifications(){
        
    }
    
    /// <#Description#>
    internal func updateUserInterfaceOnScreen(){
        
    }
    
    @IBAction func sendEmailTapped(){
        sendEmail()
    }
    
    @IBAction func sendSMSTapped(){
        sendSMS()
    }
    
    @IBAction func getAdFreeExperienceTapped(){
        Utility.noAdsClicked()
    }
    
    func sendEmail() {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["alok.singh.confident@gmail.com"])
            mail.setMessageBody("<p>\(LS("_CAN_WE_CONNECT_"))</p>", isHTML: true)
            present(mail, animated: true)
        } else {
            Utility.showAlert(view: self, title: "Error", message: LS("_SETUP_ACCOUNT_"), positiveText: "Okay", negativeText: nil, onPositive: {
            }) {}
        }
    }

    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
    
    func sendSMS() {
        if (MFMessageComposeViewController.canSendText()) {
            let controller = MFMessageComposeViewController()
            controller.body = LS("_CAN_WE_CONNECT_")
            controller.recipients = ["+918287757210"]
            controller.messageComposeDelegate = self
            self.present(controller, animated: true, completion: nil)
        }
    }
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        controller.dismiss(animated: true)
    }

}
