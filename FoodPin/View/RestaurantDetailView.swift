//
//  RestaurantDetailView.swift
//  FoodPin
//
//  Created by Che-lun Hu on 2024/7/29.
//

import SwiftUI

struct RestaurantDetailView: View {
    // @Environment屬性包裹器供開發者從視圖的環境中取值
    // \.dismiss是用來關閉目前視圖的環境值
    @Environment(\.dismiss) var dismiss
    @State private var showReview = false
    
    var restaurant: Restaurant
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    Image(restaurant.image)
                        .resizable()
                        .scaledToFill()
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .frame(height: 445)
                        .overlay {
                            VStack {
                                Image(systemName: restaurant.isFavorite ? "heart.fill" : "heart")
                                // .frame處理對齊
                                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topTrailing)
                                    .padding()
                                    .font(.system(size: 30))
                                    .foregroundStyle(restaurant.isFavorite ? .yellow : .white)
                                    .padding(.top, 40)
                                
                                VStack(alignment: .leading, spacing: 5) {
                                    Text(restaurant.name)
                                        .font(.custom("VarelaRound-Regular", size: 35, relativeTo: .largeTitle))
                                        .bold()
                                    Text(restaurant.type)
                                        .font(.custom("Kalam-Bold", size: 20, relativeTo: .title))
                                        .padding(5)
                                        .background(Color.black)
                                }
                                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .bottomLeading)
                                .foregroundStyle(.white)
                                .padding()
                            }
                        }
                    
                    Text(restaurant.description)
                        .font(.custom("VarelaRound-Regular", size: 18, relativeTo: .body))
                        .padding(.horizontal)
                        .padding(.vertical, 5)
                    
                    HStack(alignment: .top) {
                        VStack(alignment: .leading) {
                            Text("ADDRESS")
                                .font(.system(.headline, design: .rounded))
                            Text(restaurant.location)
                                .font(.custom("VarelaRound-Regular", size: 18, relativeTo: .body))
                        }
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        
                        VStack(alignment: .leading) {
                            Text("PHONE")
                                .font(.system(.headline, design: .rounded))
                            Text(restaurant.phone)
                                .font(.custom("VarelaRound-Regular", size: 18, relativeTo: .body))
                        }
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(.horizontal)
                    
                    // 點下方height200的地圖會導到全螢幕的MapView去
                    NavigationLink(destination: MapView(location: restaurant.location)
                        .toolbarBackground(.hidden, for: .navigationBar)
                        .edgesIgnoringSafeArea(.all)) {
                            MapView(location: restaurant.location)
                                .frame(height: 200)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .padding()
                        }
                    
                    Button {
                        self.showReview.toggle()
                    } label: {
                        Text("Rate it")
                            .font(.system(.headline, design: .rounded))
                            .frame(minWidth: 0, maxWidth: .infinity)
                    }
                    .tint(Color("NavigationBarTitle"))
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(.roundedRectangle(radius: 25))
                    .controlSize(.large)
                    .padding(.horizontal)
                    .padding(.bottom, 20)
                }
            }
            .navigationBarBackButtonHidden(true)    // 隱藏原本的返回鍵
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {    // 在工具列左上方新增一個自訂按鈕
                    Button(action: {
                        dismiss()
                    }) {
                        Text("\(Image(systemName: "chevron.left"))")
                    }
                }
            }
            .ignoresSafeArea()
            .toolbarBackground(.hidden, for: .navigationBar)
            .overlay(
                self.showReview ?
                ZStack {
                    ReviewView(isDisplayed: $showReview, restaurant: restaurant)
                }
                : nil
            )
            .toolbar(self.showReview ? .hidden : .visible)
            
        }
        .tint(.white)
    }
}

#Preview {
    RestaurantDetailView(restaurant: Restaurant(name: "Cafe Deadend", type: "Coffee & Tea Shop", location: "G/F, 72 Po Hing Fong, Sheung Wan, Hong Kong", phone: "232-923423", description: "Searching for great breakfast eateries and coffee? This place is for you. We open at 6:30 every morning, and close at 9 PM. We offer espresso and espresso based drink, such as capuccino, cafe latte, piccolo and many more. Come over and enjoy a great meal.", image: "cafedeadend", isFavorite: true))
}
