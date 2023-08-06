//
//  LocationSearchItem.swift
//  LocationSearchDemo
//
//  Created by Gaurav Tak on 06/08/23.
//

import Foundation
import MapKit

final class LocationSearchItem: ObservableObject {
    
    @Published var suggestions: [MKMapItem] = [MKMapItem]()
    
    init() {
    }
}
