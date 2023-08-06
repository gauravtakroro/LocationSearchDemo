//
//  HomeUi.swift
//  LocationSearchDemo
//
//  Created by Gaurav Tak on 06/08/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject var homeViewModel = HomeViewModel()
     var body: some View {
        VStack {
            if homeViewModel.locationName.isEmpty == false {
                Text("Clicked Location is \(homeViewModel.locationName)").font(.system(size: 20))
            }
            if homeViewModel.locationName.isEmpty == false {
                Text("Latitude : \(homeViewModel.locationCoordinatesLat) and Longitude : \(homeViewModel.locationCoordinatesLng) ").font(.system(size: 16))
            }
            Button {
                // button action
                homeViewModel.moveToLocationSearchView  = true
            } label: {
                Text("Search New Location ").font(.system(size: 24)).underline().bold()
            }.padding(.top, 16)
        } .sheet(isPresented: $homeViewModel.moveToLocationSearchView, onDismiss: {
            
        }, content: {
            LocationSearchBottomView(locationSearchViewModel: LocationSearchViewModel(), clickedLocationName: self.$homeViewModel.locationName, clickedLocationCoordinatesLat: self.$homeViewModel.locationCoordinatesLat, clickedLocationCoordinatesLng: self.$homeViewModel.locationCoordinatesLng)
                .padding(.top)
        })
        .padding()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

