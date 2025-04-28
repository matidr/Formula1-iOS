//
//  DriverDetailSuccessView.swift
//  SwiftUITest
//
//  Created by Matias Di Russo on 4/23/25.
//
import SwiftUI

struct DriverDetailSuccessView: View {
    let driver: Driver
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                VStack(alignment: .leading) {
                    HStack {
                        Text("\(driver.driverNumber)").font(.system(size: 32, design: .rounded)).fontWeight(.heavy).foregroundStyle(.gray)
                        AsyncImage(url: driver.countryImageURL) { result in
                            result.image?.resizable().scaledToFill()
                        }.frame(width: 40, height: 25)
                    }
                    Text(driver.name.lowercased().capitalized).font(.system(size: 32, design: .rounded)).fontWeight(.heavy).foregroundStyle(.white)
                }
                Spacer()
                AsyncImage(url: driver.helmetImageURL) { result in
                    result.image?.resizable().scaledToFill()
                }.frame(width: 100, height: 100)
                Spacer()
            }
            
            AsyncImage(url: driver.driverImageURL) { result in
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
            
            if let teamLogo = driver.teamLogo {
                AsyncImage(url: URL(string: teamLogo)) { result in
                    result.image?.resizable().scaledToFit()
                }.frame(width: 200, height: 200).cornerRadius(25).frame(maxWidth: .infinity)
            }
            
            HStack(alignment: .center) {
                Spacer()
                if let numberOfChampionships = driver.worldChampionships {
                    Image("cup").resizable().frame(width: 40, height: 40)
                    Text("\(numberOfChampionships)").font(.system(size: 18, design: .rounded)).fontWeight(.bold).foregroundStyle(.yellow)
                }
                Spacer()
                if let numberOfRaces = driver.races {
                    Image("race").renderingMode(.template).resizable().frame(width: 40, height: 40).foregroundStyle(.white)
                    Text("\(numberOfRaces)").font(.system(size: 18, design: .rounded)).fontWeight(.bold).foregroundStyle(.white)
                }
                Spacer()
                if let podiums = driver.podiums {
                    Image("podium").resizable().frame(width: 40, height: 40)
                    Text("\(podiums)").font(.system(size: 18, design: .rounded)).fontWeight(.bold).foregroundStyle(.white)
                }
                Spacer()
                if let points = driver.carreerPoints {
                    Image("points").resizable().frame(width: 30, height: 30)
                    Text("\(points)").font(.system(size: 18, design: .rounded)).fontWeight(.bold).foregroundStyle(.white)
                }
                Spacer()
            }.padding(.top, 30)
            
            Spacer()
        }.frame(maxWidth: .infinity, maxHeight: .infinity).background(.black)
    }
}

#Preview {
    DriverDetailSuccessView(driver: Driver(id: "ffVIhdbm3JG51SJTpYNM", driverNumber: 44, name: "Lewis Hamilton", teamColor: "#FF0000", teamName: "Ferrari", nameAcronym: "HAM", worldChampionships: 7, races: 230, podiums: 120, carreerPoints: "430"))
}
