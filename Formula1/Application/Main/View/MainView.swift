//
//  MainView.swift
//  Formula1
//
//  Created by Matias Di Russo on 5/5/25.
//
import SwiftUI

struct MainView: View {
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                AsyncImage(url: URL(string: "https://media.formula1.com/image/upload/f_auto,c_limit,w_285,q_auto/f_auto/q_auto/fom-website/etc/designs/fom-website/images/F1_75_Logo")) { result in
                    result.image?.resizable().scaledToFit()
                }.frame(width: 200, height: 50).clipped().padding(.bottom, 20)
                
                
                Divider()
                
                TabView {
                    DriversListView()
                        .tabItem {
                            Label("Drivers", systemImage: "person.fill")
                        }.background(.black)
                    
                    TeamListView()
                        .tabItem {
                            Label("Teams", systemImage: "car.fill")
                        }.background(.black)
                    
                }
                .background(.black)
            }
            .background(.black)
            .navigationBarHidden(true) // Hide the navigation bar if you don't want it duplicated
        }
    }
}
