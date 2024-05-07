//
//  TabPage.swift
//  socialMediaApp
//
//  Created by StudentAM on 5/3/24.
//

import SwiftUI

struct TabPage: View {
    @State var user : UserProfile
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
            ProfileView(user: user)
                .tabItem {
                    Image(systemName: "person")
                }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    TabPage(user: UserProfile(userName: "John Cena", userImg: "johncena", followers: 10, following: 5, post: 1, bio: "You can't see me"))
}
