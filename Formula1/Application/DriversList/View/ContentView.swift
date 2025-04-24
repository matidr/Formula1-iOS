//
//  ContentView.swift
//  SwiftUITest
//
//  Created by Matias Di Russo on 4/19/25.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var vm = DriversListViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                switch vm.state {
                case .loading:
                    LoadingView()
                    
                case .loaded(let drivers, let title):
                    DriversListSuccessView(title: title, drivers: drivers)
                    
                case .error(reason: let reason):
                    ErrorView(reason: reason)
                    
                }
            }.background(.black).task {
                await vm.fetchDrivers()
            }
        }
    }
}

#Preview {
    ContentView()
}
