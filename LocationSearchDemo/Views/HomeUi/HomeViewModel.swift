//
//  HomeViewModel.swift
//  LocationSearchDemo
//
//  Created by Gaurav Tak on 06/08/23.
//
import SwiftUI

protocol HomeViewModelProtocol: ObservableObject {
    var locationName: String { get set }
    var locationCoordinatesLat: Double { get set }
    var locationCoordinatesLng: Double { get set }
}
class HomeViewModel: HomeViewModelProtocol {
    @Published var locationName = ""
    @Published var locationCoordinatesLat: Double  = 0.0
    @Published var locationCoordinatesLng: Double  = 0.0
}
