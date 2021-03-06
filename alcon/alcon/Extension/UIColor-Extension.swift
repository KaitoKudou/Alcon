//
//  UIColor-Extension.swift
//  alcon
//
//  Created by 工藤海斗 on 2021/03/26.
//

import UIKit

extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        let v = Int("000000" + hex, radix: 16) ?? 0
        let r = CGFloat(v / Int(powf(256, 2)) % 256) / 255
        let g = CGFloat(v / Int(powf(256, 1)) % 256) / 255
        let b = CGFloat(v / Int(powf(256, 0)) % 256) / 255
        self.init(red: r, green: g, blue: b, alpha: min(max(alpha, 0), 1))
    }
    
    convenience init(light: UIColor, dark: UIColor) {
        self.init {
            if $0.userInterfaceStyle == .dark {
                return dark
            } else {
                return light
            }
        }
    }
}
