//
//  ColorScheme.swift
//  LoveOrHate
//
//  Created by Bleysus on 05.12.2019.
//  Copyright © 2019 Bleysus.com. All rights reserved.
//

import UIKit

protocol ColorTheme {
    var backgroudColor: UIColor { get }
    var loveColor: UIColor { get }
    var hateColor: UIColor { get }
    var textColor: UIColor { get }
    var photoColor: UIColor { get }
    var cellBackgroudColor: UIColor { get }
}

private struct DarkTheme: ColorTheme {
    var backgroudColor: UIColor {
        return UIColor(red: 0.13, green: 0.16, blue: 0.19, alpha: 1.0) //#222831  Almost black
    }
    var loveColor: UIColor {
        return UIColor(red: 0.62, green: 0.04, blue: 0.04, alpha: 1.0) //#9D0B0B  Wine red
    }
    var hateColor: UIColor {
        return UIColor(red: 0.13, green: 0.16, blue: 0.19, alpha: 1.0) //#222831  Almost black
    }
    var textColor: UIColor {
        return UIColor(red: 0.13, green: 0.16, blue: 0.19, alpha: 1.0) //#222831  Almost black
    }
    var photoColor: UIColor {
         return UIColor(red: 0.13, green: 0.16, blue: 0.19, alpha: 1.0) //#222831  Almost black
    }
    var cellBackgroudColor: UIColor {
        return UIColor(red: 0.87, green: 0.89, blue: 0.94, alpha: 1.0) //#222831  Almost blue
    }
}

private struct LightTheme: ColorTheme {
    var backgroudColor: UIColor {
        return UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1.0) //#222831  Almost white
    }
    var loveColor: UIColor {
        return UIColor(red: 0.62, green: 0.04, blue: 0.04, alpha: 1.0) //#9D0B0B  Wine red
    }
    var hateColor: UIColor {
        return UIColor(red: 0.13, green: 0.16, blue: 0.19, alpha: 1.0) //#222831  Almost black
    }
    var textColor: UIColor {
        return UIColor(red: 0.13, green: 0.16, blue: 0.19, alpha: 1.0) //#222831  Almost black
    }
    var photoColor: UIColor {
        return UIColor(red: 0.87, green: 0.89, blue: 0.94, alpha: 1.0) //#222831  Almost blue
    }
    var cellBackgroudColor: UIColor {
        return UIColor(red: 0.87, green: 0.89, blue: 0.94, alpha: 1.0) //#222831  Almost blue
    }
}

private var themeIntValue: ColorTheme {
    get {
        if K.isDarkTheme {
            return DarkTheme()
        } else {
            return LightTheme()
        }
    }
}

final class ColorScheme {
    static let shared = ColorScheme(theme: themeIntValue)
     var theme: ColorTheme
     
     init(theme: ColorTheme) {
         self.theme = theme
     }
}

extension ColorScheme: ColorTheme {
    var backgroudColor: UIColor {
        return theme.backgroudColor
    }
    var loveColor: UIColor {
        return theme.loveColor
    }
    var hateColor: UIColor {
        return theme.hateColor
    }
    var textColor: UIColor {
        return theme.textColor
    }
    var photoColor: UIColor {
        return theme.photoColor
    }
    var cellBackgroudColor: UIColor {
        return theme.cellBackgroudColor
    }
}

extension UIColor {
    class var backgroudColor: UIColor {
        return ColorScheme.shared.backgroudColor
    }
    class var loveColor: UIColor {
        return ColorScheme.shared.loveColor
    }
    class var hateColor: UIColor {
        return ColorScheme.shared.hateColor
    }
    class var textColor: UIColor {
        return ColorScheme.shared.textColor
    }
    class var photoColor: UIColor {
        return ColorScheme.shared.photoColor
    }
    class var cellBackgroudColor: UIColor {
        return ColorScheme.shared.cellBackgroudColor
    }
}

