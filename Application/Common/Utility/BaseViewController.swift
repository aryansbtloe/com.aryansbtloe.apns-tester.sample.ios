//
//  RatingView.swift
//
//
//  Created by Alok Singh on 4/18/20.
//

import Foundation
import StoreKit
#if !targetEnvironment(macCatalyst)
import GoogleMobileAds
#endif
import UIKit

@available(iOS 10.3, *)
@objc class AppStoreRatingView: NSObject {
    @objc func showRatingAlert()->Bool {
        if !UserDefaults.standard.bool(forKey: "hasShownAppStoreRatingView") {
            UserDefaults.standard.set(true, forKey: "hasShownAppStoreRatingView")
            if let view = UIApplication.shared.keyWindow?.rootViewController {
                Utility.showAlert(view: view,
                                title: "Feedback",
                                message:"How was your Experience ?",
                                positiveText: "Nice 👍",
                    negativeText: "I dont like 👎",
                    onPositive: {
                        self.launchStoreKitAlert()
                }) {}
            }
            return true
        }
        return false
    }

    /*
     Note: AppStore popup can appear only 3 times in 365 days (per device).
     */
    private func launchStoreKitAlert() {
        SKStoreReviewController.requestReview()
    }
}

extension Utility {
    
    public class func getLaunchCounter()->Int {
        return UserDefaults.standard.integer(forKey: "launchCounter")
    }
    
    public class func incrementLaunchCounter() {
        UserDefaults.standard.set(getLaunchCounter()+1, forKey: "launchCounter")
        UserDefaults.standard.synchronize()
    }
    
    public class func canShowAds()->Bool {
        return getLaunchCounter() > 1
    }
    
    public class func canAskReview()->Bool {
        if #available(iOS 10.3, *) {
            return !UserDefaults.standard.bool(forKey: "hasShownAppStoreRatingView") && getLaunchCounter() > 2
        }else{
            return false
        }
    }
    
}

#if !targetEnvironment(macCatalyst)
class BaseViewController:UIViewController,GADInterstitialDelegate {
    let interstitial:DFPInterstitial = DFPInterstitial(adUnitID: Utility.adUnitId())

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if Utility.canAskReview() {
            if #available(iOS 10.3, *) {
                AppStoreRatingView().showRatingAlert()
            }
        }else{
            if Utility.canShowAds() {
                showAdd()
            }
        }
        UserDefaults.standard.synchronize()
    }
    
    /// Called when an interstitial ad request succeeded. Show it at the next transition point in your
    /// application such as when transitioning between view controllers.
    func interstitialDidReceiveAd(_ ad: GADInterstitial) {
        if interstitial.isReady {
            interstitial.present(fromRootViewController: self)
        }
    }
    /// Called when an interstitial ad request completed without an interstitial to
    /// show. This is common since interstitials are shown sparingly to users.
    func interstitial(_ ad: GADInterstitial, didFailToReceiveAdWithError error: GADRequestError) {
        
    }
    
    /// Called just before presenting an interstitial. After this method finishes the interstitial will
    /// animate onto the screen. Use this opportunity to stop animations and save the state of your
    /// application in case the user leaves while the interstitial is on screen (e.g. to visit the App
    /// Store from a link on the interstitial).
    func interstitialWillPresentScreen(_ ad: GADInterstitial) {
        
    }
    
    /// Called when |ad| fails to present.
    func interstitialDidFail(toPresentScreen ad: GADInterstitial) {
        
    }
    
    /// Called before the interstitial is to be animated off the screen.
    func interstitialWillDismissScreen(_ ad: GADInterstitial) {
        
    }
    /// Called just after dismissing an interstitial and it has animated off the screen.
    func interstitialDidDismissScreen(_ ad: GADInterstitial) {
        
    }
    
    /// Called just before the application will background or terminate because the user clicked on an
    /// ad that will launch another application (such as the App Store). The normal
    /// UIApplicationDelegate methods, like applicationDidEnterBackground:, will be called immediately
    /// before this.
    func interstitialWillLeaveApplication(_ ad: GADInterstitial) {
        
    }
    
    func showAdd() {
        interstitial.load(DFPRequest())
        interstitial.delegate = self
    }

}
#else
class BaseViewController:UIViewController {
    func showAdd() {
    }
}
#endif

