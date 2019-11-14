//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Patrick Millet on 11/14/19.
//  Copyright © 2019 Patrick Millet. All rights reserved.
//
import UIKit
import Foundation

class ThemeHelper {
    var themePreferenceKey: String = ""
    
    var themePreference: String? {
        return UserDefaults.standard.string(forKey: .themeKey)
    }

    init() {
        if themePreference == nil {
            SetThemePreferenceToYourColorHere()
        }
    }
    
    func setThemePreferenceToDark() {
        UserDefaults.standard.set("Dark", forKey: .themeKey)
        themePreferenceKey = "Dark"
    }
    
    func SetThemePreferenceToYourColorHere() {
        UserDefaults.standard.set("Red", forKey: .themeKey)
        themePreferenceKey = "Red"
    }
    
    
}
