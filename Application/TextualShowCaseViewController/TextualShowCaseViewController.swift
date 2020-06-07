//
//  TextualShowCaseViewController.swift
//  Application
//
//  Created by Alok Singh on 4/17/20.
//  Copyright © 2020 Alok Singh. All rights reserved.
//

import UIKit

/// <#Description#>
class TextualShowCaseViewController : BaseViewController {
    
    @IBOutlet weak var textView: UITextView!
    var viewModel:[String:String]=[:]
    
    
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
        if let path = Bundle.main.path(forResource: viewModel["fileName"], ofType: "rtf") {
            let url = URL(fileURLWithPath:path)
            do {
                let attributedStringWithRtf: NSAttributedString = try NSAttributedString(url: url, options: [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.rtf], documentAttributes: nil)
                self.textView.attributedText = attributedStringWithRtf
            } catch let error {
                print(error)
            }
        }
    }
    /// <#Description#>
    internal func setupForNavigationBar(){
        self.navigationController?.title = viewModel["title"]
    }
    
    /// <#Description#>
    internal func registerForNotifications(){
        
    }
    
    /// <#Description#>
    internal func updateUserInterfaceOnScreen(){
        
    }
}
