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
	
	@Published var mapLocation: Location
	
	let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1);
	
	@Published var mapPosition: MapCameraPosition
	
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
 
	
	
}
