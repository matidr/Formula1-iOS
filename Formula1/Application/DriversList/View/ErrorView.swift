//
//  ErrorView.swift
//  SwiftUITest
//
//  Created by Matias Di Russo on 4/21/25.
//
import SwiftUI

struct ErrorView: View {
    let reason: String
    
    var body: some View {
        ZStack {
            Text("Error: \(reason)").foregroundStyle(.white)
        }.frame(maxWidth: .infinity, minHeight: UIScreen.main.bounds.height, maxHeight: .infinity).ignoresSafeArea()
    }
}
