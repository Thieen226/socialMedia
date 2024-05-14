//
//  TabPage.swift
//  socialMediaApp
//
//  Created by StudentAM on 5/3/24.
//

import SwiftUI

struct TabPage: View {
    @State var user : UserProfile
    @State private var tabSelected: Int = 1
    @State var loggedInfo : [UserInfo]
    @State var profiles : [UserProfile]
    
    var body: some View {
        TabView(selection: $tabSelected){
            HomeView(loggedInfo: loggedInfo, profiles: profiles)
                .tabItem {
                    Image(systemName: "house")
                }
                .tag(1)
            AddPost(loggedIn: loggedInfo, user: user, profiles: profiles)
                .tabItem {
                    Image(systemName: "plus.square")
                }
                .tag(2)
            ProfileView(user: user, loggedIn: loggedInfo, tabSelected: tabSelected)
                .tabItem {
                    Image(systemName: "person")
                }
                .tag(3)
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    TabPage(user: UserProfile(userName: "John Cena", userImg: "johncena", followers: 10, following: 5, post: 1, bio: "You can't see me"), loggedInfo: [], profiles: [])
}
