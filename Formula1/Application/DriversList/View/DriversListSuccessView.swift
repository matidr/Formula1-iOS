//
//  SuccessView.swift
//  SwiftUITest
//
//  Created by Matias Di Russo on 4/21/25.
//
import SwiftUI

struct DriversListSuccessView: View {
    let title: String
    let drivers: [DriverTileUI]
    
    var body: some View {
        LazyVStack(alignment: .center, spacing: 15) {
            Text(title).font(.system(size: 32, design: .rounded)).fontWeight(.heavy).foregroundStyle(.white).padding([.bottom], 25)
            ForEach(Array(drivers), id: \.id) { driver in
                NavigationLink(destination: DriverDetailView(driverId: driver.id)) {
                    VStack(alignment: .leading) {
                        HStack {
                            Rectangle()
                                .frame(width: 5)
                                .frame(maxHeight: .infinity)
                                .foregroundStyle(Color(hex: driver.teamColor))
                            VStack(alignment: .leading, spacing: 0) {
                                HStack {
                                    Text("\(driver.name)").font(.system(size: 20, design: .rounded)).foregroundStyle(.white)
                                    AsyncImage(url: driver.countryImage) { result in
                                        result.image?.resizable().scaledToFill()
                                    }.frame(width: 30, height: 15).clipped()
                                }
                                Text("\(driver.lastName)").font(.system(size: 28, design: .rounded)).fontWeight(.heavy).foregroundStyle(.white)
                                Text("\(driver.teamName)").foregroundStyle(Color(hex: driver.teamColor)).padding(.top, 8)
                            }
                            Spacer()
                            AsyncImage(url: driver.driverNumberImage) { result in
                                result.image?.renderingMode(.template).resizable().scaledToFit()
                            }.frame(width: 60, height: 60).foregroundColor(Color(hex: driver.teamColor))
                            Spacer()
                            AsyncImage(url: driver.driverImage) { result in
                                result.image?.resizable().scaledToFill()
                            }.scaleEffect(1.5, anchor: .top)
                                .frame(width: 100, height: 100)
                                .clipped()
                                .cornerRadius(25)
                        }
                    }.padding()
                }
            }
        }
    }
}
