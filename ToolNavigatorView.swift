//
//  ToolNavigatorView.swift
//  MechanicFinder
//
//  Created by Zach kaplani  on 4/24/23.
//

import SwiftUI

struct ToolNavigatorView: View {
    @State var tool = ""
    @State var ToolSearch = ""
    @State var shoppingCartItems:[String] = []
    var body: some View{
        VStack{
            
            TextField("Enter Tool Here", text: $ToolSearch)
                .foregroundColor(.blue)
                .textFieldStyle(.roundedBorder)
                .padding()
      
            List{
                Button {
                    tool = "WrenchImage"
                    shoppingCartItems.append(tool)
                } label: {
                    Image("WrenchImage")
                        .resizable()
                        .padding(.vertical)
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                        .foregroundColor(.blue)
                    
                }
                Button {
                    tool = "TorqueWrenchImage"
                    shoppingCartItems.append(tool)
                } label: {
                    Image("TorqueWrenchImage")
                        .resizable()
                        .padding(.vertical)
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                        .foregroundColor(.blue)
                    
                }
                Button {
                    tool = "DrillImage"
                    shoppingCartItems.append(tool)
                } label: {
                    Image("DrillImage")
                        .resizable()
                        .padding(.vertical)
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                        .foregroundColor(.blue)
                    
                }
                NavigationLink {
                    ShoppingCartView()
                } label: {
                    Image("ScrewDriver")
                        .resizable()
                        .padding(.vertical)
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                        .foregroundColor(.blue)
                }
                NavigationLink {
                    ShoppingCartView()
                } label: {
                    Image("TireIron")
                        .resizable()
                        .padding(.vertical)
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                        .foregroundColor(.blue)
                }
                NavigationLink {
                    ShoppingCartView()
                } label: {
                    Image("CarJack")
                        .resizable()
                        .padding(.vertical)
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                        .foregroundColor(.blue)
                }
                NavigationLink {
                    ShoppingCartView()
                } label: {
                    Image("SocketWrencg")
                        .resizable()
                        .padding(.vertical)
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                        .foregroundColor(.blue)
                    
                }
            }
        }
        
        NavigationLink {
            ShoppingCartView(shoppingCartItems: $shoppingCartItems)
        } label: {
            Image(systemName: "cart.fill")
                .scaleEffect(3)
        }
        
        
    }
}
