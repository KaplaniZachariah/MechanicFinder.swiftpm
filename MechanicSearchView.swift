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
    
    @State var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.0902, longitude: -95.7129), span: MKCoordinateSpan(latitudeDelta: 25, longitudeDelta: 25))
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
                
                ToolbarItem(id: "findMyLocation", placement: .navigationBarLeading) {
                    LocationButton(.shareCurrentLocation) {
                        locationManager.requestLocation()
                    }
                    .frame(width: 250, height: 50)
                    .background(.blue)
                    .clipShape(Capsule())
                    .foregroundColor(.black)
                }
                
                ToolbarItem(id: "zoomIn", placement: .navigationBarTrailing) {
                    Button {
                        zoomIn()
                    } label: {
                        Image(systemName: "location.fill")
                            .frame(width: 75, height: 50)
                            .background(.blue)
                            .clipShape(Capsule())
                            .foregroundColor(.black)
                    }
                    
                }
                
                
                ToolbarItem(id: "increaseSearchRadius", placement: .bottomBar) {
                    Button {
                        latitudeDeltaNumber += 0.005
                        longitudeDeltaNumber += 0.005
                        setRegion()
                    } label: {
                        Text("+ Radius")
                            .font(.caption)
                            .frame(width: 75, height: 50)
                            .background(.blue)
                            .clipShape(Capsule())
                            .foregroundColor(.black)
                    }
                }
                
                ToolbarItem(id: "decreaseSearchRadius", placement: .bottomBar) {
                    Button {
                        latitudeDeltaNumber -= 0.005
                        longitudeDeltaNumber -= 0.005
                        if latitudeDeltaNumber < 0.005 {
                            latitudeDeltaNumber = 0.005
                            longitudeDeltaNumber = 0.005
                        }
                        setRegion()
                    } label: {
                        Text("- Radius")
                            .font(.caption)
                            .frame(width: 75, height: 50)
                            .background(.blue)
                            .clipShape(Capsule())
                            .foregroundColor(.black)
                    }
                }
             
                
                ToolbarItem(id: "findMechanics", placement: .bottomBar) {
                    Button {
                        findMechanicShop()
                    } label: {
                        Text("Find Mechanics")
                            .frame(width: 175, height: 50)
                            .background(.blue)
                            .clipShape(Capsule())
                            .foregroundColor(.black)
                    }
                }
            }
        }
        .navigationViewStyle(.stack)
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
            region = MKCoordinateRegion(center: userLocation, span: MKCoordinateSpan(latitudeDelta: latitudeDeltaNumber, longitudeDelta: longitudeDeltaNumber))
        }
        
    }
}
