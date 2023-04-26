//
//  ToolNavigatorView.swift
//  MechanicFinder
//
//  Created by Zach kaplani  on 4/24/23.
//

import SwiftUI

struct ToolNavigatorView: View {
   @State var image = ""
    
    var body: some View{
        VStack{
            
            NavigationView(){
              
                Button {
                    ShoppingCartView()
                } label: {
                    Image("WrenchImage")
                        .padding()
                        .clipShape(Circle())
                        .foregroundColor(.blue)
                }

                    
                    
                    
                
                
            }
        }
    }
}
