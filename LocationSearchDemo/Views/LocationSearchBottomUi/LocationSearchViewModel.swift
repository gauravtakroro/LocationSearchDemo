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
    var locationSearchItems: LocationSearchItem { get set }
}
class LocationSearchViewModel: NSObject, LocationSearchViewModelProtocol {
    @Published var input = ""
    @Published var locationSearchItems = LocationSearchItem()
    var searchCompleter = MKLocalSearchCompleter()
    @Published var searchResults = [MKLocalSearchCompletion]()
   
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

