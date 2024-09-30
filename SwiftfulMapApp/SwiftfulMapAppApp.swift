//
//  SwiftfulMapAppApp.swift
//  SwiftfulMapApp
//
//  Created by Radha Devi H on 30/09/24.
//

import SwiftUI

@main
struct SwiftfulMapAppApp: App {
	@StateObject private var vm = LocationsViewModel();
    var body: some Scene {
        WindowGroup {
			LocationsView().environmentObject(vm)
        }
    }
}
