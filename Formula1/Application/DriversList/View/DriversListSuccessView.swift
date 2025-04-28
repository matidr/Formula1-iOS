//
//  SuccessView.swift
//  SwiftUITest
//
//  Created by Matias Di Russo on 4/21/25.
//
import SwiftUI

struct DriversListSuccessView: View {
    let title: String
    let drivers: [Driver]
    
    var body: some View {
        LazyVStack(alignment: .center, spacing: 15) {
            Text(title).font(.system(size: 32, design: .rounded)).fontWeight(.heavy).foregroundStyle(.white).padding([.top, .bottom], 50)
            ForEach(Array(drivers), id: \.id) { driver in
                NavigationLink(destination: DriverDetailView(driverId: driver.id)) {
                    VStack(alignment: .leading) {
                        HStack {
                            ZStack(alignment: .center) {
                                Circle().fill(Color(hex: driver.teamColor)).frame(width: 30, height: 30).overlay {
                                    Circle().stroke(.white, lineWidth: 2)
                                }
                                Text("\(driver.driverNumber)").foregroundStyle(.white)
                            }
                            AsyncImage(url: driver.driverImageURL) { result in
                                result.image?.resizable().scaledToFill()
                            }.scaleEffect(1.5, anchor: .top) // Zoom in 30%, anchored at the top
                                .frame(width: 100, height: 100)
                                .clipped()
                                .cornerRadius(25)
                            VStack {
                                Text("\(driver.name.lowercased().capitalized)").foregroundStyle(.white)
                                Text("\(driver.teamName.lowercased().capitalized)").foregroundStyle(Color(hex: driver.teamColor))
                            }
                            Spacer()
                            Text("\(driver.nameAcronym.uppercased())").foregroundStyle(.white).padding(5).background(Color(hex: driver.teamColor)).cornerRadius(10).overlay {
                                RoundedRectangle(cornerRadius: 10).stroke(.white, lineWidth: 2)
                            }
                        }
                        Divider().frame(height: 2).overlay(RoundedRectangle(cornerRadius: 25).foregroundStyle(Color(hex: driver.teamColor)))
                    }.padding()
                }
            }
        }
    }
}
