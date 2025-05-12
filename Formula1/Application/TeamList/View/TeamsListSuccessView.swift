//
//  TeamsListSuccessView.swift
//  Formula1
//
//  Created by Matias Di Russo on 5/12/25.
//
import SwiftUI

struct TeamsListSuccessView: View {
    let title: String
    let teams: [TeamTileUI]
    
    var body: some View {
        LazyVStack(alignment: .center, spacing: 15) {
            Text(title).font(.system(size: 32, design: .rounded)).fontWeight(.heavy).foregroundStyle(.white).padding([.bottom], 25)
            ForEach(Array(teams), id: \.id) { team in
                NavigationLink(destination: TeamDetailView(teamId: team.id)) {
                    HStack(alignment: .top) {
                        VStack(alignment: .leading) {
                            Text("\(team.name)").font(.system(size: 28, design: .rounded)).fontWeight(.heavy).foregroundStyle(.white)
                            AsyncImage(url: team.teamCarImage) { result in
                                result.image?.resizable().scaledToFit()
                            }.frame(width: 160, height: 50)
                        }
                        Spacer()
                        AsyncImage(url: team.teamLogoImage) { result in
                            result.image?.resizable().scaledToFill()
                        }.frame(width: 170, height: 80)
                    }.padding()
                }
            }
        }
    }
}
