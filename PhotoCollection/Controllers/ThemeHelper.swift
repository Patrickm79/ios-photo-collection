//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Patrick Millet on 11/14/19.
//  Copyright © 2019 Patrick Millet. All rights reserved.
//

import Foundation

class ThemeHelper {
    var themePreferenceKey: String = ""
    
    var setThemePreference: String? {
        return UserDefaults.standard.string(forKey: .themeKey)
    }

    init() {
        if setThemePreference == nil {
            SetThemePreferenceToYourColorHere()
        }
    }
    
    func setThemePreferenceToDark() {
        UserDefaults.standard.set("Dark", forKey: .themeKey)
    }
    
    func SetThemePreferenceToYourColorHere() {
        UserDefaults.standard.set("Red", forKey: .themeKey)
    }
    
    
}
