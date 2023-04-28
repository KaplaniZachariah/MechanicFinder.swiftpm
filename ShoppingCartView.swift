//
//  ShoppingCartView.swift
//  MechanicFinder
//
//  Created by Zach kaplani  on 4/24/23.
//

import SwiftUI


struct ShoppingCartView: View {
    
    var body: some View {
        NavigationView{
            VStack {
                Text("Your Items:")
                    .font(.title)
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.center)
            }
        }
    }
}
