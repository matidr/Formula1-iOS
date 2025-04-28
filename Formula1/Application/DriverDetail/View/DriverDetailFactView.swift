//
//  DriverDetailFactView.swift
//  Formula1
//
//  Created by Matias Di Russo on 4/28/25.
//
import SwiftUI

struct DriverDetailFactView: View {
    let label: String
    let value: String
    
    var body: some View {
        HStack {
            Text(label).font(.system(size: 18, design: .rounded)).fontWeight(.bold).foregroundStyle(.white)
            Spacer()
            Text(value).font(.system(size: 18, design: .rounded)).foregroundStyle(.white)
        }.padding(.vertical, 5)
    }
}
