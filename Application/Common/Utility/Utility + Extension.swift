//
//  Utility.swift
//  
//
//  Created by Alok Singh on 4/18/20.
//

import Foundation
import UIKit

extension Utility {
    
    class func setupCommonAppearance() {
        UIBarButtonItem.appearance(whenContainedInInstancesOf: [UINavigationBar.classForCoder() as! UIAppearanceContainer.Type]).setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
    }

}

