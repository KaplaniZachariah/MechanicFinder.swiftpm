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
    
    var body: some View {
        
        Map(coordinateRegion: $region, showsUserLocation: true, annotationItems: mechanicShops) { userLocation in
            MapMarker(coordinate: userLocation.coordinate)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
        HStack{
            Button(action: {
                locationManager.requestLocation()
                zoomIn()
            }, label: {
                Text("Share Location")
                    .frame(width: 200, height: 75)
                    .background(.blue)
                    .foregroundColor(.black)
                    .font(.title2)
                    .clipShape(Capsule())
                    .padding(10)
            })
            Button {
                findMechanicShop()
            } label: {
                ZStack {
                    Image(systemName: "car.side.front.open.fill")
                        .resizable()
                        .scaledToFit()
                        .padding(10)
                        .foregroundColor(.white)
                    Text("Find\nMechanics")
                        .font(.headline)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .offset(x: 15, y: -15)
                    
                }
            }
        }
    }
    
    func setRegion() {
        region = MKCoordinateRegion(center: locationManager.myLocation!, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
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
