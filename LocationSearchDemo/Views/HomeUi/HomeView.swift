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
                Text("Clicked Location is \(homeViewModel.locationName)").font(.system(size: 24))
            }
            if homeViewModel.locationName.isEmpty == false {
                Text("\(homeViewModel.locationName) Latitude : \(homeViewModel.locationCoordinatesLat) and Longitude : \(homeViewModel.locationCoordinatesLng) ").font(.system(size: 20))
            }
            Button {
                // button action
                homeViewModel.moveToLocationSearchView  = true
            } label: {
                Text("Search New Location ").font(.system(size: 24)).underline().bold()
            }
        } .sheet(isPresented: $homeViewModel.moveToLocationSearchView, onDismiss: {
            
        }, content: {
            LocationSearchBottomView( locationSearchViewModel: LocationSearchViewModel(), clickedLocationName: self.$homeViewModel.locationName)
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

