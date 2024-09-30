//
//  LocationsView.swift
//  SwiftfulMapApp
//
//  Created by Radha Devi H on 30/09/24.
//

import SwiftUI
import MapKit

struct LocationsView: View {
	
	@EnvironmentObject private var vm : LocationsViewModel
	
    var body: some View {
		ZStack {
			Map(position: $vm.mapPosition)
				.ignoresSafeArea()
		}
	
    }
}

#Preview {
		LocationsView().environmentObject(LocationsViewModel())
	}
