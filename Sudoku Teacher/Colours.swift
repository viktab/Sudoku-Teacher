//
//  Colours.swift
//  Sudoku Teacher
//
//  Created by Viktoriya Tabunshchyk on 2021-01-01.
//  Copyright © 2021 Viktoriya Tabunshchyk. All rights reserved.
//

import Foundation
import UIKit

class Colours {
    
    let light_purple: UIColor = UIColor(red: 233/255, green: 208/255, blue: 245/255, alpha: 1)
    let light_purple2: UIColor = UIColor(red: 203/255, green: 159/255, blue: 224/255, alpha: 1)
    let purple: UIColor = UIColor(red: 142/255, green: 18/255, blue: 199/255, alpha: 1)
    let dark_purple: UIColor = UIColor(red: 33/255, green: 4/255, blue: 46/255, alpha: 1)
    
    let light_yellow: UIColor = UIColor(red: 245/255, green: 243/255, blue: 208/255, alpha: 1)
    let light_yellow2: UIColor = UIColor(red: 235/255, green: 230/255, blue: 164/255, alpha: 1)
    let yellow: UIColor = UIColor(red: 189/255, green: 158/255, blue: 36/255, alpha: 1)
    let dark_yellow: UIColor = UIColor(red: 64/255, green: 64/255, blue: 3/255, alpha: 1)
    
    let light_black: UIColor = UIColor(red: 241/255, green: 241/255, blue: 241/255, alpha: 1)
    let light_black2: UIColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1)
    let black: UIColor = UIColor(red: 84/255, green: 84/255, blue: 84/255, alpha: 1)
    let dark_black: UIColor = UIColor(red: 38/255, green: 38/255, blue: 38/255, alpha: 1)
    
    let light_blue: UIColor = UIColor(red: 208/255, green: 231/255, blue: 245/255, alpha: 1)
    let light_blue2: UIColor = UIColor(red: 159/255, green: 197/255, blue: 224/255, alpha: 1)
    let blue: UIColor = UIColor(red: 18/255, green: 121/255, blue: 199/255, alpha: 1)
    let dark_blue: UIColor = UIColor(red: 4/255, green: 26/255, blue: 46/255, alpha: 1)
    
    let light_green: UIColor = UIColor(red: 215/255, green: 245/255, blue: 208/255, alpha: 1)
    let light_green2: UIColor = UIColor(red: 170/255, green: 224/255, blue: 159/255, alpha: 1)
    let green: UIColor = UIColor(red: 45/255, green: 199/255, blue: 18/255, alpha: 1)
    let dark_green: UIColor = UIColor(red: 7/255, green: 36/255, blue: 4/255, alpha: 1)
    
    var currentTheme: String = "Purple"
    
    init(_ colour: String) {
        currentTheme = colour
    }
    
    func getColourLight() -> UIColor {
        switch currentTheme {
        case "Purple": return light_purple
        case "Yellow": return light_yellow
        case "Black" : return light_black
        case "Blue"  : return light_blue
        case "Green" : return light_green
        default      : return light_purple
        }
    }
    
    func getColourLight2() -> UIColor {
        switch currentTheme {
        case "Purple": return light_purple2
        case "Yellow": return light_yellow2
        case "Black" : return light_black2
        case "Blue"  : return light_blue2
        case "Green" : return light_green2
        default      : return light_purple2
        }
    }
    
    func getColour() -> UIColor {
        switch currentTheme {
        case "Purple": return purple
        case "Yellow": return yellow
        case "Black" : return black
        case "Blue"  : return blue
        case "Green" : return green
        default      : return purple
        }
    }
    
    func getColourDark() -> UIColor {
        switch currentTheme {
        case "Purple": return dark_purple
        case "Yellow": return dark_yellow
        case "Black" : return dark_black
        case "Blue"  : return dark_blue
        case "Green" : return dark_green
        default      : return dark_purple
        }
    }
}
