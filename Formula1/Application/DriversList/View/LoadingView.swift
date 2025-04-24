//
//  LoadingView.swift
//  SwiftUITest
//
//  Created by Matias Di Russo on 4/21/25.
//
import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            ProgressView().tint(.white)
        }.frame(maxWidth: .infinity, minHeight: UIScreen.main.bounds.height, maxHeight: .infinity).ignoresSafeArea()
    }
}
