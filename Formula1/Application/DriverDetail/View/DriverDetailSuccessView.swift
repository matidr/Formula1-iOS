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
            Text(driver.name)
        }
    }
}
