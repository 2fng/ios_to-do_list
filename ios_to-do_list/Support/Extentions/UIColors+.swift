//
//  UIColors+.swift
//  ios_to-do_list
//
//  Created by Hua Son Tung on 24/07/2023.
//

import Foundation
import UIKit

extension UIColor {
    static func hex(_ hexStr: String, alpha: CGFloat = 1) -> UIColor {
        let scanner = Scanner(string: hexStr.replacingOccurrences(of: "#", with: ""))
        var color: UInt64 = 0
        if scanner.scanHexInt64(&color) {
            let redColor = CGFloat((color & 0xFF0000) >> 16) / 255.0
            let greenColor = CGFloat((color & 0x00FF00) >> 8) / 255.0
            let blueColor = CGFloat(color & 0x0000FF) / 255.0
            return UIColor(red: redColor, green: greenColor, blue: blueColor, alpha: alpha)
        } else {
            return .white
        }
    }

    static func rgba(_ red: Int?, green: Int?, blue: Int?, alpha: CGFloat = 1.0) -> UIColor {

        guard let redColor = red, let greenColor = green, let blueColor = blue else {
            return .white
        }

        let denominator: CGFloat = 255.0
        let color = UIColor(red: CGFloat(redColor) / denominator,
                            green: CGFloat(greenColor) / denominator,
                            blue: CGFloat(blueColor) / denominator,
                            alpha: alpha)
        return color
    }

    static let primaryDark = UIColor.hex("#1B1B1B")
    static let tabbarUnselected = UIColor.hex("646464")
    static let primary = UIColor.link
}
