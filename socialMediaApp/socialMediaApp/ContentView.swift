//
//  ContentView.swift
//  socialMediaApp
//
//  Created by StudentAM on 4/26/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("BeMe")
                .font(Font.custom("MadimiOne-Regular", size: 80))
                .foregroundColor(.blue)
            Text("Welcome!")
                .font(Font.custom("MadimiOne-Regular", size: 30))
                .fontWeight(.bold)
        }
        Spacer()
        .padding()
    }
}

#Preview {
    ContentView()
}
