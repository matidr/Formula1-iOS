//
//  DriverDetailSuccessView.swift
//  SwiftUITest
//
//  Created by Matias Di Russo on 4/23/25.
//
import SwiftUI

struct DriverDetailSuccessView: View {
    let driver: DriverDetailUI
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                VStack(alignment: .leading) {
                    HStack {
                        Text("\(driver.driverNumber)").font(.system(size: 32, design: .rounded)).fontWeight(.heavy).foregroundStyle(.gray)
                        AsyncImage(url: driver.countryImage) { result in
                            result.image?.resizable().scaledToFill()
                        }.frame(width: 40, height: 25)
                    }
                    Text(driver.name.lowercased().capitalized).font(.system(size: 32, design: .rounded)).fontWeight(.heavy).foregroundStyle(.white)
                }
                Spacer()
                AsyncImage(url: driver.helmetImage) { result in
                    result.image?.resizable().scaledToFill()
                }.frame(width: 100, height: 100)
                Spacer()
            }
            
            AsyncImage(url: driver.heroImage) { result in
                result.image?.resizable().scaledToFill()
            }.frame(maxWidth: .infinity, maxHeight: 180, alignment: .top)
                .offset(y: -10)
                .mask(
                    LinearGradient(
                        gradient: Gradient(stops: [
                            .init(color: .clear, location: 0.0),
                            .init(color: .black.opacity(0.9), location: 0.05),
                            .init(color: .black.opacity(0.9), location: 0.95),
                            .init(color: .clear, location: 1.0)
                        ]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .mask(
                    LinearGradient(
                        gradient: Gradient(stops: [
                            .init(color: .clear, location: 0),
                            .init(color: .black.opacity(0.9), location: 0.05),
                            .init(color: .black.opacity(0.9), location: 0.95),
                            .init(color: .clear, location: 1)
                        ]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                ).clipped()
            
            Spacer().frame(height: 50)
            
            if let podiums = driver.podiums {
                DriverDetailFactView(label: "Podiums", value: "\(podiums)")
            }
            
            if let points = driver.totalPoints {
                DriverDetailFactView(label: "Points", value: points)
            }
            
            if let numberOfRaces = driver.totalRaces {
                DriverDetailFactView(label: "Grands Prix entered", value: "\(numberOfRaces)")
            }
            
            if let numberOfChampionships = driver.worldChampionships {
                DriverDetailFactView(label: "World Championships", value: "\(numberOfChampionships)")
            }
            
            if let teamLogo = driver.teamImage {
                AsyncImage(url: teamLogo) { result in
                    result.image?.resizable().scaledToFit()
                }.frame(width: 200, height: 200).cornerRadius(25).frame(maxWidth: .infinity)
            }
            
            if let bio = driver.bio {
                Text("Biography").font(.system(size: 24, design: .rounded)).fontWeight(.bold).foregroundStyle(.white).padding(.vertical)
                Text("\(bio)").font(.system(size: 14, design: .rounded)).fontWeight(.bold).foregroundStyle(.white).padding(.vertical)
            }
            
            Spacer()
        }.frame(maxWidth: .infinity, maxHeight: .infinity).background(.black).padding(.horizontal, 10)
    }
}

#Preview {
    DriverDetailSuccessView(driver: DriverDetailUI(id: "ffVIhdbm3JG51SJTpYNM", driverNumber: 44, name: "Lewis Hamilton", worldChampionships: 7, totalRaces: 230, podiums: 120, totalPoints: "430"))
}
