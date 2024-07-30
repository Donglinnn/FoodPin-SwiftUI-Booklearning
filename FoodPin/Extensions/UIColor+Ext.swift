//
//  UIColor+Ext.swift
//  FoodPin
//
//  Created by Che-lun Hu on 2024/7/30.
//

import Foundation
import UIKit

// UIColor extensions
// 這樣一來使用自訂RGB就不用再額外除以255
extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        let redValue = CGFloat(red) / 255.0
        let greenValue = CGFloat(green) / 255.0
        let blueValue = CGFloat(blue) / 255.0
        
        self.init(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
    }
}
