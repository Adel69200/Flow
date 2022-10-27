//
//  FlowApp.swift
//  Flow
//
//  Created by Apprenant 63 on 20/10/2022.
//

import SwiftUI


@main
struct FlowApp: App {
    
    @StateObject private var vm = LocationsViewModel()
    
    var body: some Scene {
        WindowGroup {
            ConnexionView()
                .environmentObject(vm)
        }
    }
}
