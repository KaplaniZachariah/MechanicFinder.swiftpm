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
    @State private var PopUp = false
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
                    PopUp = true
                } label: {
                    Image("WrenchImage")
                        .resizable()
                        .padding(.vertical)
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                        .foregroundColor(.blue)
                        .alert(isPresented: $PopUp) {
                            Alert(
                                title: Text("Add This Item To Cart"),
                                primaryButton: .cancel(Text("Yes")),
                        secondaryButton: .destructive(Text("No")))
                            
                        }
                        
                    
                }
                Button {
                    tool = "TorqueWrenchImage"
                    shoppingCartItems.append(tool)
                    PopUp = true
                } label: {
                    Image("TorqueWrenchImage")
                        .resizable()
                        .padding(.vertical)
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                        .foregroundColor(.blue)
                        .alert(isPresented: $PopUp) {
                            Alert(
                                title: Text("Add This Item To Cart"),
                                primaryButton: .cancel(Text("Yes")),
                        secondaryButton: .destructive(Text("No")))
                            
                        }
                        
                    
                }
                Button {
                    tool = "DrillImage"
                    shoppingCartItems.append(tool)
                    PopUp = true
                } label: {
                    Image("DrillImage")
                        .resizable()
                        .padding(.vertical)
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                        .foregroundColor(.blue)
                        .alert(isPresented: $PopUp) {
                            Alert(
                                title: Text("Add This Item To Cart"),
                                primaryButton: .cancel(Text("Yes")),
                        secondaryButton: .destructive(Text("No")))
                            
                        }
                      
                    
                }
                Button {
                    tool = "ScrewDriver"
                    shoppingCartItems.append(tool)
                    PopUp = true
                } label: {
                    Image("ScrewDriver")
                        .resizable()
                        .padding(.vertical)
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                        .foregroundColor(.blue)
                        .alert(isPresented: $PopUp) {
                            Alert(
                                title: Text("Add This Item To Cart"),
                                primaryButton: .cancel(Text("Yes")),
                        secondaryButton: .destructive(Text("No")))
                            
                        }
                       
                    
                }
                Button {
                    tool = "TireIron"
                    shoppingCartItems.append(tool)
                    PopUp = true
                } label: {
                    Image("TireIron")
                        .resizable()
                        .padding(.vertical)
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                        .foregroundColor(.blue)
                        .alert(isPresented: $PopUp) {
                            Alert(
                                title: Text("Add This Item To Cart"),
                                primaryButton: .cancel(Text("Yes")),
                        secondaryButton: .destructive(Text("No")))
                            
                        }
                       
                }
                Button {
                    tool = "CarJack"
                    shoppingCartItems.append(tool)
                    PopUp = true
                } label: {
                    Image("CarJack")
                        .resizable()
                        .padding(.vertical)
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                        .foregroundColor(.blue)
                        .alert(isPresented: $PopUp) {
                            Alert(
                                title: Text("Add This Item To Cart"),
                                primaryButton: .cancel(Text("Yes")),
                        secondaryButton: .destructive(Text("No")))
                            
                        }
                       
                }
                Button {
                    tool = "SocketWrench"
                    shoppingCartItems.append(tool)
                    PopUp = true
                } label: {
                    Image("SocketWrench")
                        .resizable()
                        .padding(.vertical)
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                        .foregroundColor(.blue)
                        .alert(isPresented: $PopUp) {
                            Alert(
                                title: Text("Add This Item To Cart"),
                                primaryButton: .cancel(Text("Yes")),
                        secondaryButton: .destructive(Text("No")))
                            
                        }
                      
                }
                Button {
                    tool = "RubberMallet"
                    shoppingCartItems.append(tool)
                    PopUp = true
                } label: {
                    Image("RubberMallet")
                        .resizable()
                        .padding(.vertical)
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                        .foregroundColor(.blue)
                        .alert(isPresented: $PopUp) {
                            Alert(
                                title: Text("Add This Item To Cart"),
                                primaryButton: .cancel(Text("Yes")),
                        secondaryButton: .destructive(Text("No")))
                            
                        }
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

