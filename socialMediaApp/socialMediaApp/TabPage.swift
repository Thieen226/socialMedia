//
//  TabPage.swift
//  socialMediaApp
//
//  Created by StudentAM on 5/3/24.
//

import SwiftUI

struct TabPage: View {
    var body: some View {
        TabView{
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                }
            Text("Upload Post")
                .tabItem {
                    Image(systemName: "plus.square")
                }
            Text("Profile")
                .tabItem {
                    Image(systemName: "person")
                }
        }
    }
}

#Preview {
    TabPage()
}
