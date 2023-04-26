//
//  ToolNavigatorView.swift
//  MechanicFinder
//
//  Created by Zach kaplani  on 4/24/23.
//

import SwiftUI

struct ToolNavigatorView: View {
    @State var ToolSearch: String
    var body: some View{
        VStack{
            NavigationView(){
                TextField("Enter Tool Here", text: $ToolSearch)
                    .foregroundColor(.blue)
                Button("Add to Cart") {
                    
                }
            }
        }
    }
}
