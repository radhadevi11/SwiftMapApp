//
//  LocationsViewModel.swift
//  SwiftfulMapApp
//
//  Created by Radha Devi H on 30/09/24.
//

import Foundation
//import MapKit
import _MapKit_SwiftUI
import SwiftUI

class LocationsViewModel: ObservableObject {
	
	@Published var locations : [Location]
	
	@Published var mapLocation: Location {
		didSet {
			updateMapRegion(location: mapLocation)
		}
	}
	
	let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1);
	
	@Published var mapPosition: MapCameraPosition
	
	@Published var showLocationsList: Bool = false
	
	@Published var sheetLocation: Location? = nil
	
	init() {
		let locations = LocationsDataService.locations;
		self.locations = locations;
		self.mapLocation = locations.first!
		self.mapPosition = .region(MKCoordinateRegion(center: locations.first!.coordinates, span: mapSpan))
		
		
	}
	private func updateMapRegion(location : Location) {
		withAnimation(.easeInOut) {
			mapPosition = .region (MKCoordinateRegion(center: location.coordinates, span: mapSpan));
		}
		
	}
	
	func showNextLocation(location: Location) {
		withAnimation(.easeInOut) {
			mapLocation = location
			showLocationsList = false
		}
	}
	
	func toggleLocationsList() {
		withAnimation(.easeInOut) {
			showLocationsList.toggle()
		}
	}
	
	func nextButtonPressed() {
		guard let currentIndex = locations.firstIndex(where: { $0 == mapLocation }) else {
			print("Could not find current index in locations array! Should never happen.")
			return
		}
		
		// Check if the currentIndex is valid
		let nextIndex = currentIndex + 1
		guard locations.indices.contains(nextIndex) else {
			guard let firstLocation = locations.first else { return }
			showNextLocation(location: firstLocation)
			return
		}
		
		let nextLocation = locations[nextIndex]
		showNextLocation(location: nextLocation)
	}
	
 
	
	
}
