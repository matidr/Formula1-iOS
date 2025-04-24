//
//  DriverDetailView.swift
//  SwiftUITest
//
//  Created by Matias Di Russo on 4/20/25.
//

import SwiftUI

struct DriverDetailView: View {
    let driverName: String
    @StateObject var vm = DriverDetailViewModel()
    
    var body: some View {
        ScrollView {
            switch vm.state {
            case .loading:
                LoadingView()
                
            case .loaded(let driver):
                DriverDetailSuccessView(driver: driver)
                
            case .error(reason: let reason):
                ErrorView(reason: reason)
                
            }
        }.background(.black).task {
            await vm.fetchDriver(name: driverName)
        }
    }
}

#Preview {
    DriverDetailView(driverName: "Lewis Hamilton")
}
