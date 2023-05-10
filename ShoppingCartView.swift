//
//  ShoppingCartView.swift
//  MechanicFinder
//
//  Created by Zach kaplani  on 4/24/23.
//

import SwiftUI


struct ShoppingCartView: View {
    
    @Binding var shoppingCartItems:[String]
   
    
    var body: some View {
        NavigationView{
            VStack {
                Text("Your Items:")
                    .font(.title)
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

