//
//  CheckOutView.swift
//  MechanicFinder
//
//  Created by Zach kaplani  on 5/10/23.
//

import SwiftUI

struct CheckOutView: View {
    
    @Binding var shoppingCartItems:[String]
    
    var body: some View {
        NavigationView{
            VStack {
                Text("Your Orders:")
                    .font(.title)
                    .foregroundColor(Color.blue)
                Text("Swipe To Delete")
                    .font(.caption)
                    .foregroundColor(Color.blue)
                List{
                    
                    ForEach(shoppingCartItems, id: \.self) {
                        cartItem in
                        Image("\(cartItem)")
                            .resizable()
                            .padding(.vertical)
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                            .foregroundColor(.purple)
                    }
                    .onDelete { ( indexSet )  in
                        if let index = indexSet.first {
                            self.shoppingCartItems.remove(at: index)
                        }
                        
                    }
                }
                
            }
        }
    }
}
