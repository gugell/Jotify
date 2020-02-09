//
//  Themes.swift
//  Jotify
//
//  Created by Harrison Leath on 7/16/19.
//  Copyright © 2019 Harrison Leath. All rights reserved.
//

import UIKit

struct InterfaceColors {
    // colors for light/dark mode toggle
    static var viewBackgroundColor = UIColor()
    static var navigationBarColor = UIColor()
    static var cellColor = UIColor()
    static var fontColor = UIColor()
    static var writeViewColor = UIColor()
    static var searchBarColor = UIColor()
    static var actionSheetColor = UIColor()
    static var separatorColor = UIColor()
}

class Themes {
    func setupVibrantDarkMode() {
        InterfaceColors.writeViewColor = Colors.grayBackground
        InterfaceColors.viewBackgroundColor = Colors.grayBackground
        InterfaceColors.cellColor = Colors.cellDark
        InterfaceColors.fontColor = .white
        InterfaceColors.navigationBarColor = Colors.grayBackground
        InterfaceColors.searchBarColor = Colors.grayBackground
        InterfaceColors.actionSheetColor = Colors.grayBackground
        InterfaceColors.separatorColor = .white
    }

    func setupPureDarkMode() {
        InterfaceColors.writeViewColor = .black
        InterfaceColors.viewBackgroundColor = .black
        InterfaceColors.cellColor = Colors.cellPureDark ?? Colors.cellDark
        InterfaceColors.fontColor = .white
        InterfaceColors.navigationBarColor = .black
        InterfaceColors.searchBarColor = .black
        InterfaceColors.actionSheetColor = .black
        InterfaceColors.separatorColor = .white
    }

    func setupDefaultMode() {
        InterfaceColors.viewBackgroundColor = .white
        InterfaceColors.navigationBarColor = .white
        InterfaceColors.searchBarColor = .white
        InterfaceColors.cellColor = Colors.cellLight
        InterfaceColors.fontColor = .black
    }
    
    func triggerSystemMode(mode: UITraitCollection) {
        if UserDefaults.standard.bool(forKey: "useSystemMode") {
            if mode.userInterfaceStyle == .light {
                setupDefaultMode()
                UserDefaults.standard.set(false, forKey: "darkModeEnabled")
                UserDefaults.standard.set(false, forKey: "vibrantDarkModeEnabled")
                UserDefaults.standard.set(false, forKey: "pureDarkModeEnabled")
            } else if mode.userInterfaceStyle == .dark {
                setupVibrantDarkMode()
                UserDefaults.standard.set(true, forKey: "darkModeEnabled")
                UserDefaults.standard.set(true, forKey: "vibrantDarkModeEnabled")
            } else {
                setupDefaultMode()
                UserDefaults.standard.set(false, forKey: "darkModeEnabled")
                UserDefaults.standard.set(false, forKey: "vibrantDarkModeEnabled")
                UserDefaults.standard.set(false, forKey: "pureDarkModeEnabled")
            }
        }
    }
}
