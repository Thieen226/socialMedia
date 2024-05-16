//
//  TabPage.swift
//  socialMediaApp
//
//  Created by StudentAM on 5/3/24.
//

import SwiftUI

struct TabPage: View {
    @Binding var user : UserProfile
    @State private var tabSelected: Int = 1
    @Binding var loggedInfo : [UserInfo]
    @State var profiles : [UserProfile]
    @Binding var users : [UserInfo]
    
    var body: some View {
        TabView(selection: $tabSelected){
            HomeView(loggedInfo: $loggedInfo, profiles: profiles, users: users)
                .tabItem {
                    Image(systemName: "house")
                }
                .tag(1)
            AddPost(loggedIn: $loggedInfo, user: $user, users: $users)
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
    TabPage(user: .constant(UserProfile(userName: "John Cena", userImg: "johncena", followers: 10, following: 5, post: 1, bio: "You can't see me")), loggedInfo: .constant([UserInfo(username: "", password: "", posts: [Post(userImage: "thieen", userName: "thieen", content: "Corgi iz da bezt", caption: "Like if you also like corgi!!!!!!", hasImage: false)])]), profiles: [], users: .constant([]))
}
