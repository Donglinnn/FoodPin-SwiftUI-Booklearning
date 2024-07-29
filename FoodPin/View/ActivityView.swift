//
//  ActivityView.swift
//  FoodPin
//
//  Created by Che-lun Hu on 2024/7/29.
//

import Foundation
import SwiftUI

/*
 // MARK: - 運用動態控制器
 UIKit中有UIActivityViewController標準視圖控制器，提供複製項目至剪貼簿、在社群網站上分享內容、
 透過Messages傳送項目等等，但SwiftUI還沒有加入此元件。
 因此需透過建立UIViewRepresentable與UIViewControllerRepresentable協定的型別將UIKit視圖與視圖控制器整合至SwiftUI中。
 */
struct ActivityView: UIViewControllerRepresentable {
    var activityItems: [Any]
    var applicationActivities: [UIActivity]? = nil
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let activityController = UIActivityViewController(activityItems: activityItems, applicationActivities: applicationActivities)
        return activityController
    }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}
