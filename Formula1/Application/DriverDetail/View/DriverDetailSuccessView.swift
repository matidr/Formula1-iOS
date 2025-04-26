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
        VStack {
            Text(driver.name.lowercased().capitalized).font(.system(size: 32, design: .rounded)).fontWeight(.heavy).foregroundStyle(.white)
            Text(driver.teamName.lowercased().capitalized).font(.system(size: 24, design: .rounded)).foregroundStyle(Color(hex: driver.teamColor))
            
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
    DriverDetailSuccessView(driver: Driver(id: 44, name: "Lewis Hamilton", teamColor: "#FF0000", teamName: "Ferrari", nameAcronym: "HAM", worldChampionships: 7, races: 230, podiums: 120, carreerPoints: "430"))
}
