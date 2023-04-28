//
//  ToolNavigatorView.swift
//  MechanicFinder
//
//  Created by Zach kaplani  on 4/24/23.
//

import SwiftUI

struct ToolNavigatorView: View {
   @State var image = ""
   @State var ToolSearch = ""
    var body: some View{
        VStack{
            
                TextField("Enter Tool Here", text: $ToolSearch)
                    .foregroundColor(.blue)
                    
                
                NavigationLink {
                    ShoppingCartView()
                } label: {
                    Image("WrenchImage")
                        .padding()
                        .clipShape(Circle())
                        .foregroundColor(.blue)
                }
            NavigationLink {
                ShoppingCartView()
            } label: {
                Image("TorqueWrenchImage")
                    .padding()
                    .clipShape(Circle())
                    .foregroundColor(.blue)
            }
            NavigationLink {
                ShoppingCartView()
            } label: {
                Image("DrillImage")
                    .padding()
                    .clipShape(Circle())
                    .foregroundColor(.blue)
            }

                    
                    
                    
                
                
            }
        }
    }

