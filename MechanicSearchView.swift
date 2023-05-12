//
//  MechanicSearchView.swift
//  MechanicFinder
//
//  Created by Zach kaplani  on 4/24/23.
//

import SwiftUI
import MapKit
import CoreLocation
import CoreLocationUI

struct MechanicSearchView: View {
    
    @State var region = MKCoordinateRegion()
    @State var mechanicShops: [Location] = []
    @StateObject var locationManager = LocationManager()
    @State var latitudeDeltaNumber:Double = 0.05
    @State var longitudeDeltaNumber:Double = 0.05
    @State var alertPresent:Bool = false
    
    var body: some View {
        NavigationView {
            Map(coordinateRegion: $region, showsUserLocation: true, annotationItems: mechanicShops) { userLocation in
                MapMarker(coordinate: userLocation.coordinate)
            }
            //            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            .toolbar {
                
                ToolbarItem(id: "findMyLocation", placement: .primaryAction) {
                    LocationButton(.shareCurrentLocation) {
                        locationManager.requestLocation()
                        zoomIn()
                    }
                    .frame(width: 250, height: 75)
                    .background(.blue)
                    .clipShape(Capsule())
                    .foregroundColor(.black)
                }
                
                
                ToolbarItem(id: "increaseSearchRadius", placement: .bottomBar) {
                    Button {
                        latitudeDeltaNumber += 0.025
                        longitudeDeltaNumber += 0.025
                        setRegion()
                    } label: {
                        Text("Increase Search Radius")
                    }
                }
            
                ToolbarItem(id: "decreaseSearchRadius", placement: .bottomBar) {
                    Button {
                        latitudeDeltaNumber -= 0.025
                        longitudeDeltaNumber -= 0.025
//                        if latitudeDeltaNumber == 0 {
//                            alertPresent = true
                        if latitudeDeltaNumber == 0 {
                            latitudeDeltaNumber = 0.025
                            longitudeDeltaNumber = 0.025
                        }
//                        }
                    } label: {
                        Text("Increase Search Radius")
                    }
                }
//                .alert(isPresented: $alertPresent) {
//                    Alert(
//                        title: Text("Search Radius Cannot be 0"),
//                        primaryButton: .cancel(Text("Okay")))
//                }
                
                ToolbarItem(id: "findMechanics", placement: .bottomBar) {
                    Button {
                        findMechanicShop()
                    } label: {
                        Text("Find Mechanics")
                            .frame(width: 300, height: 75)
                            .background(.blue)
                            .clipShape(Capsule())
                            .foregroundColor(.black)
                    }
                }
            }
        }
    }
    
    func setRegion() {
        region = MKCoordinateRegion(center: locationManager.myLocation!, span: MKCoordinateSpan(latitudeDelta: latitudeDeltaNumber, longitudeDelta: longitudeDeltaNumber))
    }
    
    func findMechanicShop() {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = "mechanic"
        request.region = region
        let search = MKLocalSearch(request: request)
        search.start { (response, error) in
            guard let response = response else { return }
            for mechanicShop in response.mapItems {
                let newMechanicShop = Location(name: mechanicShop.name ?? "Shop Not Found", coordinate: mechanicShop.placemark.coordinate)
                mechanicShops.append(newMechanicShop)
            }
        }
    }
    
    func zoomIn() {
        withAnimation(.default) {
            guard let userLocation = locationManager.myLocation else { return }
            region = MKCoordinateRegion(center: userLocation, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
        }
        
    }
}
