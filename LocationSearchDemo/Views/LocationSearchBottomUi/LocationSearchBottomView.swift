//
//  LocationSearchBottomView.swift
//  LocationSearchDemo
//
//  Created by Gaurav Tak on 06/08/23.
//

import SwiftUI

struct LocationSearchBottomView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @StateObject var locationSearchViewModel: LocationSearchViewModel
    @Binding var clickedLocationName: String
    @Binding var clickedLocationCoordinatesLat: Double
    @Binding var clickedLocationCoordinatesLng: Double
    
    var body: some View {
        
        VStack {
            HStack {
                Spacer()
                Button {
                    mode.wrappedValue.dismiss()
                } label: {
                    Image("icon_cross")
                }.frame(alignment: .trailing)
            }.frame(maxWidth: .infinity).frame(alignment: .trailing)
            HStack {
                Image("icon-search")
                TextField("Search Location", text: $locationSearchViewModel.input)
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                    .padding(.leading)
                    .font(.system(size: 20))
                    .frame(height: 52)
                    .onChange(of: locationSearchViewModel.input) { newValue in
                        locationSearchViewModel.findSearch(searchText: newValue)
                    }.padding(.leading, -10)
            }.padding(.top, 16)
            
            Rectangle()
                .frame(height: 1)
                .foregroundColor(Color.gray).opacity(0.3)
                .padding(.top, -10)
        
            ScrollView(showsIndicators: false) {
                if let locations = locationSearchViewModel.searchResults, !locationSearchViewModel.searchResults.isEmpty {
                    ForEach(0..<locations.count, id: \.self) { index in
                        VStack(alignment: .leading, spacing: 10) {
                            Button {
                                clickedLocationName = locations[index].title
                                locationSearchViewModel.performSearchForLatLng(inputValue: clickedLocationName, completionHandler: {
                                    self.clickedLocationCoordinatesLat = locationSearchViewModel.clickedLocationLat
                                    self.clickedLocationCoordinatesLng = locationSearchViewModel.clickedLocationLng
                                    mode.wrappedValue.dismiss()
                                })
                            } label: {
                                HStack {
                                    Image("marker")
                                    Text(locations[index].title)
                                        .font(.system(size: 16)).foregroundColor(Color.black)
                                }.frame(alignment: .leading)
                            }
                            Rectangle()
                                .frame(height: 1)
                                .foregroundColor(Color.gray).opacity(0.3)
                            
                        }.frame(maxWidth: .infinity).padding(.top, 16)
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .padding(.horizontal)
        .padding(.top , 16).frame(maxHeight: .infinity)
    }
}
