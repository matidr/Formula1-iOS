//
//  DriverDetailView.swift
//  SwiftUITest
//
//  Created by Matias Di Russo on 4/20/25.
//

import SwiftUI

struct DriverDetailView: View {
    let driverId: String
    
    @StateObject var vm = DriverDetailViewModel()
    
    var body: some View {
        ScrollView {
            switch vm.state {
            case .loading:
                LoadingView()
                
            case .loaded(let driver):
                DriverDetailSuccessView(driver: driver).navigationBarHidden(true).navigationBarBackButtonHidden(true)
                
            case .error(reason: let reason):
                ErrorView(reason: reason)
                
            }
        }.background(.black).task {
            await vm.fetchDriver(driverId: driverId)
        }
    }
}

#Preview {
    DriverDetailView(driverId: "ffVIhdbm3JG51SJTpYNM")
}
