//
//  ShoppingCartView.swift
//  MechanicFinder
//
//  Created by Zach kaplani  on 4/24/23.
//

import SwiftUI


struct ShoppingCartView: View {
    @State var Tools: [String] = ["Wrench", "Torque Wrench", "Hammer", "Tire Iron", "Jack", "Crobar"]
    
    
    //  note, this is a temporary replacement to help get the idea across on what this  page is supposed to look like, this text in the array will eventually be replaced by images that can be entered as a variable from the tool navigator view and entered as an image on this page. 
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
