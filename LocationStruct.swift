//
//  LocationStruct.swift
//  MechanicFinder
//
//  Created by Josh Hartman on 4/28/23.
//

import SwiftUI
import CoreLocation

struct Location: Identifiable {
    
    let id =  UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
    
}
