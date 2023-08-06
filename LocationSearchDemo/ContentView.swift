//
//  ContentView.swift
//  LocationSearchDemo
//
//  Created by Gaurav Tak on 06/08/23.
//

import SwiftUI

struct ContentView: View {
    @State var locationName = ""
    @State var locationCoordinatesText = ""
    var body: some View {
        HomeView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
