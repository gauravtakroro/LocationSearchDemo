//
//  LocationSearchViewModel.swift
//  LocationSearchDemo
//
//  Created by Gaurav Tak on 06/08/23.
//

import SwiftUI
import MapKit

protocol LocationSearchViewModelProtocol: ObservableObject {
    var input: String { get set }
    func findSearch(searchText: String)
    func getLatLngUsingLocationTitle(inputValue: String, completionHandler: @escaping () -> Swift.Void)
    var clickedLocationLat: Double { get set }
    var clickedLocationLng: Double { get set }
}
class LocationSearchViewModel: NSObject, LocationSearchViewModelProtocol {
    @Published var input = ""
    var searchCompleter = MKLocalSearchCompleter()
    @Published var searchResults = [MKLocalSearchCompletion]()
    var clickedLocationLat: Double = 0.0
    var clickedLocationLng: Double = 0.0
   
    public override init() {
        super.init()
        searchCompleter.delegate = self
    }
    
    func findSearch(searchText: String) {
        searchCompleter.queryFragment = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

extension LocationSearchViewModel: MKLocalSearchCompleterDelegate {
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        searchResults = completer.results
    }
    
    func completer(_ completer: MKLocalSearchCompleter, didFailWithError error: Error) {
         searchResults = [MKLocalSearchCompletion]()
    }
}

extension LocationSearchViewModel {
    func getLatLngUsingLocationTitle(inputValue: String, completionHandler: @escaping () -> Swift.Void) {
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = inputValue

        let search = MKLocalSearch(request: searchRequest)
        search.start { (response, error) in
            guard let response = response else {
                return
            }

            for item in response.mapItems {
                if let _ = item.name,
                   let location = item.placemark.location {
                    self.clickedLocationLat = location.coordinate.latitude
                    self.clickedLocationLng = location.coordinate.longitude
                }
            }
            completionHandler()
        }
    }
}

