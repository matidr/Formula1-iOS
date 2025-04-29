//
//  ViewExtensions.swift
//  Formula1
//
//  Created by Matias Di Russo on 4/29/25.
//
import SwiftUI

extension View {
    @ViewBuilder
    func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}
