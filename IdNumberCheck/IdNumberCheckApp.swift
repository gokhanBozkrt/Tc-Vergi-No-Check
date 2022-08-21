//
//  IdNumberCheckApp.swift
//  IdNumberCheck
//
//  Created by Gokhan Bozkurt on 27.07.2022.
//

import SwiftUI

@main
struct IdNumberCheckApp: App {
    @StateObject private var vm: HomeViewModel
    @State private var showLaunchView = true
    init() {
        let vm = HomeViewModel()
        _vm = StateObject(wrappedValue: vm)
        UITableView.appearance().backgroundColor = UIColor.clear
        UINavigationBar.appearance().largeTitleTextAttributes = [ .foregroundColor : UIColor(Color.white)]
      

    }
    var body: some Scene {
        WindowGroup {
            ZStack {
                NavigationView {
                    HomeView()
                        .navigationTitle("TC & Vergi Doğrulama")
                       
                      
                }
                .navigationViewStyle(.stack)
                .environmentObject(vm)
                ZStack {
                    if showLaunchView {
                        LaunchView(showLaunchView: $showLaunchView)
                            .transition(.move(edge: .leading))
                    }
                }
            }
        }
    }
}
