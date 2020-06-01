//
//  Utility.swift
//  
//
//  Created by Alok Singh on 4/18/20.
//

import Foundation
import UIKit
#if !targetEnvironment(macCatalyst)
import Firebase
import GoogleMobileAds
#endif
class Utility {
    
    public class func setupApp() {
        incrementLaunchCounter()
        setupAnalytics()
        setupAds()
    }

    public class func setupAnalytics(){
        #if !targetEnvironment(macCatalyst)
        FirebaseApp.configure()
        #endif
    }

    public class func setupAds(){
        #if !targetEnvironment(macCatalyst)
        GADMobileAds.sharedInstance().start(completionHandler: nil)
        #endif
    }

    public class func adUnitId()->String{
        return "ca-app-pub-7178447751314817/2069445475"
    }

    public class func getDocumentsDirectory() -> String {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        return documentsDirectory.relativePath
    }
        
    /// Helper Function to Show Alert with Closure Callbacks.
    /// @noobjc = as, it objc don't support Generic
    ///
    /// - Parameters:
    ///   - view: Context View
    ///   - title: Title Message
    ///   - message: Message
    ///   - positiveText: Positive Text
    ///   - negativeText: Negative Text
    ///   - positiveAction: Positive Action Closure
    ///   - negativeAction: Negative Action Closure
    static func showAlert(view: UIViewController?, title: String?, message: String?, positiveText: String?, negativeText: String?, onPositive positiveAction:(() -> Void)?, onNegative negativeAction:(() -> Void)?) {
        if (title != nil || message != nil) && (positiveText != nil || negativeText != nil) {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            if positiveText != nil {
                alert.addAction(UIAlertAction(title: positiveText, style: .cancel, handler: { (_) in
                    if let action = positiveAction {
                        action()
                    }
                }))
            }
            if negativeText != nil {
                alert.addAction(UIAlertAction(title: negativeText, style: .default, handler: { (_) in
                    if let action = negativeAction {
                        action()
                    }
                }))
            }
            DispatchQueue.main.async {
                if let controller = view  {
                    controller.present(alert, animated: true)
                } else {
                    rootViewController()?.present(alert, animated: true)
                }
            }
        }
    }
}

