//
//  SettingsView.swift
//  MechanicFinder
//
//  Created by Michael Grabowy on 5/2/23.
//



import SwiftUI

struct SettingsView: View {
    @State private var LocationtoggleSwitch = false
    @State private var MechanictoggleSwitch = false
    @State private var ContacttoggleSwitch = false
    @State var ZIPcodeToggle = false
    @State var ZIPcode = ""
    
    var body: some View {
        Text("Settings")
            .font(.title)
            .foregroundColor(.blue)
        List{
            Toggle("Show Location", isOn: $LocationtoggleSwitch)
            
            if LocationtoggleSwitch {
                Text("Location is On")
                    .padding(.horizontal)
            }
            
            Toggle("Allow Mechanics Near You to Know Your Location", isOn: $MechanictoggleSwitch)
            
            if MechanictoggleSwitch {
                Text("location Allowed to be Accessed")
                    .padding(.horizontal)
            }
            Toggle("Allow MechanicFinder to Access Basic Contact Information", isOn: $ContacttoggleSwitch)
            
            if ContacttoggleSwitch {
                Text("Yes")
                    .padding(.horizontal)
            }
            TextField("Enter ZIP Code Here", text: $ZIPcode)
                .foregroundColor(.blue)
                .textFieldStyle(.roundedBorder)
                .padding()
            
            
        
        Toggle("Enter ZIP Code", isOn: $ZIPcodeToggle)
        
            if ZIPcodeToggle {
                Text("Allowed")
                    .padding(.horizontal)
            }
        }
    }
}

