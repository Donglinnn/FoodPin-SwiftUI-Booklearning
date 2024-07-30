//
//  FoodPinApp.swift
//  FoodPin
//
//  Created by Che-lun Hu on 2024/7/29.
//

import SwiftUI

@main
struct FoodPinApp: App {
    var body: some Scene {
        WindowGroup {
            RestaurantListView()
        }
    }
    
    init() {
        // 如何在SwiftUI專案中自訂導覽列?
        
        // 使用UIKit來更改導覽列標題的字型顏色
        let navBarAppearance = UINavigationBarAppearance()
        // 下句的??語法為Double Question Mark
        // 等同於 UIColor(named...) != nil ? UIColor(named...) : UIColor.systemRed
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor(named: "NavigationBarTitle") ?? UIColor.systemRed, .font: UIFont(name: "ArialRoundedMTBold", size: 35)!]
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor(named: "NavigationbarTitle") ?? UIColor.systemRed, .font: UIFont(name: "ArialRoundedMTBold", size: 20)!]
        navBarAppearance.backgroundColor = .clear
        navBarAppearance.backgroundEffect = .none
        navBarAppearance.shadowColor = .clear
        UINavigationBar.appearance().standardAppearance = navBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
        UINavigationBar.appearance().compactAppearance = navBarAppearance
    }
}
