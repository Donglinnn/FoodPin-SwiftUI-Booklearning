//
//  RestaurantListView.swift
//  FoodPin
//
//  Created by Che-lun Hu on 2024/7/29.
//

import SwiftUI
import SwiftData

struct RestaurantListView: View {
    // MARK: - Array of Restaurant
    @State var restaurants = [
        Restaurant(name: "Cafe Deadend", type: "Coffee & Tea Shop", location: "Hong Kong", image: "cafedeadend"),
        Restaurant(name: "Homei", type: "Cafe", location: "Hong Kong", image: "homei"),
        Restaurant(name: "Teakha", type: "Tea House", location: "Hong Kong", image: "teakha"),
        Restaurant(name: "Cafe loisl", type: "Austrian / Casual Drink", location: "Hong Kong", image: "cafeloisl"),
        Restaurant(name: "Petite Oyster", type: "French", location: "Hong Kong", image: "petiteoyster"),
        Restaurant(name: "For Kee Restaurant", type: "Bakery", location: "Hong Kong", image: "forkee"),
        Restaurant(name: "Po's Atelier", type: "Bakery", location: "Hong Kong", image: "posatelier"),
        Restaurant(name: "Bourke Street Backery", type: "Chocolate", location: "Sydney", image: "bourkestreetbakery"),
        Restaurant(name: "Haigh's Chocolate", type: "Cafe", location: "Sydney", image: "haigh"),
        Restaurant(name: "Palomino Espresso", type: "American / Seafood", location: "Sydney", image: "palomino"),
        Restaurant(name: "Upstate", type: "American", location: "New York", image: "upstate"),
        Restaurant(name: "Traif", type: "American", location: "New York", image: "traif"),
        Restaurant(name: "Graham Avenue Meats", type: "Breakfast & Brunch", location: "New York", image: "graham"),
        Restaurant(name: "Waffle & Wolf", type: "Coffee & Tea", location: "New York", image: "waffleandwolf"),
        Restaurant(name: "Five Leaves", type: "Coffee & Tea", location: "New York", image: "fiveleaves"),
        Restaurant(name: "Cafe Lore", type: "Latin American", location: "New York", image: "cafelore"),
        Restaurant(name: "Confesstional", type: "Spanish", location: "New York", image: "confessional"),
        Restaurant(name: "Barrafina", type: "Spanish", location: "London", image: "barrafina"),
        Restaurant(name: "Donostia", type: "Spanish", location: "London", image: "donostia"),
        Restaurant(name: "Royal Oak", type: "British", location: "London", image: "royaloak"),
        Restaurant(name: "CASK Pub and Kitchen", type: "Thai", location: "London", image: "cask")
    ]
    
    var body: some View {
        List {
            ForEach(restaurants.indices, id: \.self) { index in
                BasicTextImageRow(restaurant: $restaurants[index])
            }
            // onDelete是加到ForEach
            .onDelete(perform: { indexSet in
                restaurants.remove(atOffsets: indexSet)
            })
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
        
    }
}


#Preview {
    RestaurantListView()
}
#Preview("Dark mode") {
    RestaurantListView()
        .preferredColorScheme(.dark)
}

#Preview("BasicTextImageRow", traits: .sizeThatFitsLayout) {
    BasicTextImageRow(restaurant: .constant(Restaurant(name: "Cafe Deadend", type: "Cafe", location: "Hong Kong", image: "cafedeadend", isFavorite: true)))
        .preferredColorScheme(.dark)
}

#Preview("FullImageRow", traits: .sizeThatFitsLayout) {
    FullImageRow(restaurant: .constant(Restaurant(name: "Cafe Deadend", type: "Cafe", location: "Hong Kong", image: "cafedeadend", isFavorite: true)))
}

struct BasicTextImageRow: View {
    // MARK: - Binding
    @Binding var restaurant: Restaurant
    
    // MARK: - State Variables
    @State private var showOptions = false
    @State private var showError = false
    
    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            Image(restaurant.image)
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 118)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            
            VStack(alignment: .leading) {
                Text(restaurant.name)
                    .font(.system(.title2, design: .rounded))
                
                Text(restaurant.type)
                    .font(.system(.body, design: .rounded))
                
                Text(restaurant.location)
                    .font(.system(.subheadline, design: .rounded))
                    .foregroundStyle(.gray)
            }
            .padding(.horizontal)
            .padding(.bottom)
            
            if restaurant.isFavorite {
                Spacer()
                
                Image(systemName: "heart.fill")
                    .foregroundStyle(.yellow)
            }
        }
        // 長按會出現的menu
        .contextMenu {
            Button(action: {
                self.showError.toggle()
            }) {
                HStack {
                    Text("Reserve a table")
                    Image(systemName: "phone")
                }
            }
            
            Button(action: {
                self.restaurant.isFavorite.toggle()
            }) {
                HStack {
                    Text(restaurant.isFavorite ? "Remove from favorites" : "Mark as favorite")
                    Image(systemName: "heart")
                }
            }
            
        }
        .alert("Not yet available", isPresented: $showError) {
            Button("OK") {}
        } message: {
            Text("Sorry, this feature is not available yet. Please try later.")
        }
    }
}

struct FullImageRow: View {
    
    @State private var showOptions = false
    @State private var showError = false
    @Binding var restaurant: Restaurant
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Image(restaurant.image)
                .resizable()
                .scaledToFill()
                .frame(height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            
            HStack(alignment: .top, spacing: 10) {
                VStack(alignment: .leading) {
                    Text(restaurant.name)
                        .font(.system(. title2, design: .rounded))
                    
                    Text(restaurant.type)
                        .font(.system(.body, design: .rounded))
                    
                    Text(restaurant.location)
                        .font(.system(.subheadline, design: .rounded))
                        .foregroundStyle(.gray)
                }
                .padding(.horizontal)
                .padding(.bottom)
                
                if restaurant.isFavorite {
                    Spacer()
                    Image(systemName: "heart.fill")
                        .foregroundStyle(.yellow)
                }
            }
        }
        .contextMenu {
            
            Button(action: {
                self.showError.toggle()
            }) {
                HStack {
                    Text("Reserve a table")
                    Image(systemName: "phone")
                }
            }
            
            Button(action: {
                self.restaurant.isFavorite.toggle()
            }) {
                HStack {
                    Text(restaurant.isFavorite ? "Remove from favorites" : "Mark as favorite")
                    Image(systemName: "heart")
                }
            }
            
        }
        .alert("Not yet available", isPresented: $showError) {
            Button("OK") {}
        } message: {
            Text("Sorry, this feature is not available yet. Please try later.")
        }
    }
}
