//
//  ColorScheme.swift
//  LoveOrHate
//
//  Created by Bleysus on 05.12.2019.
//  Copyright © 2019 Bleysus.com. All rights reserved.
//

import UIKit

protocol ColorTheme {
    var main: UIColor { get }
}

struct DarkTheme: ColorTheme {
    var main: UIColor {
        return .black
    }
}

struct LightTheme: ColorTheme {
    var main: UIColor {
        return .white
    }
}

final class ColorScheme {    
    static let shared = ColorScheme(theme: LightTheme())
     var theme: ColorTheme
     
     init(theme: ColorTheme) {
         self.theme = theme
     }
}

extension ColorScheme: ColorTheme {
    var main: UIColor {
        return theme.main
    }
}

extension UIColor {
    class var backgroudColor: UIColor {
        return ColorScheme.shared.main
    }
}

