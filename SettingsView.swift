//
//  SettingsView.swift
//  MechanicFinder
//
//  Created by Zachariah Kaplani on 5/2/23.
//



import SwiftUI

struct SettingsView: View {
    @State private var LocationtoggleSwitch = false
    @State private var MechanictoggleSwitch = false
    @State private var ContacttoggleSwitch = false
    @State var ZIPcodeToggle = false
    @State var ZIPcode = ""
    @State private var selection = "States"
    let States = ["Arizona", "Washington", "Oregon", "California", "New Mexico", "Texas", "Luisiana", "Mississippi", "Alabama", "Georgia", "Florida", "South Carolina", "North Carolina", "Vriginia", "Washington DC", "Pennsylvania", "New York", "New Jersey", "Delaware", "Maryland", "West Virginia", "Rhode Island", "Connecticut", "Massachusetts", "Vermont", "New Hampshire", "Maine", "Ohio", "Indiana", "Michigan", "illinois", "Wisconsin", "Minnesota", "Iowa", "Missouri", "Arkansas", "Tennessee", "Kentucky", "Oklahoma", "Kansas", "Nebraska", "South Dekota", "North Dekota", "Montana", "Wyoming", "Colorado", "Utah", "Idaho", "Nevada", "Alaska", "Hawaii"]
    @AppStorage("Pick Country of Origin") var CountryPicker = "Countries"
    let Countries = ["United States", "Canada", "Mexico", "Panama", "Brazil", "Ecuador", "France", "United Kingdom", "Ireland", "Portugal", "Belgium", "Germany", "Italy", "Norway", "Sweden", "Ukraine", "Belarus", "Serbia", "China", "Nepal", "India", "Thailand", "Indonesia", "Iraq", "Iran", "Saudi Arabia", "Yemen", "Oman", "Egypt", "Libya", "Nigheria", "Pakistan", "Isreal", "Palestine", "Taiwan", "Russia", "Mongolia", "Czech Republic", "Romania"]

    
    var body: some View {
        Text("Settings")
            .font(.title)
            .foregroundColor(.blue)
        List{
            Group {
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
                
              
                
               
                   
                   
                Picker("Select a State", selection: $selection) {
                    ForEach(States, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.menu)
                
                Text("Selected State: \(selection)")
            }
            Group{
                TextField("Enter ZIP Code Here", text: $ZIPcode)
                            .foregroundColor(.blue)
                    .textFieldStyle(.roundedBorder)
                    .padding()
               
                    Picker("Select a Country", selection: $CountryPicker) {
                        ForEach(Countries, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.menu)
                }
            }
        }
    }

