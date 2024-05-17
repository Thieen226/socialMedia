//
//  HomeView.swift
//  socialMediaApp
//
//  Created by StudentAM on 4/29/24.
//

import SwiftUI

struct Post: Hashable{
    var userImage: String
    var userName: String
    var content: String
    var caption: String
    var hasImage: Bool
}

struct HomeView: View {
    @Binding var loggedInfo : [UserInfo]
    @State var profiles : [UserProfile]
    @Binding var users : [UserInfo]
    
    var body: some View {
        NavigationStack{
            ScrollView{
                LazyVStack{
                    ForEach(users.indices, id:\.self){ i in //search the user
                        ForEach(users[i].posts.indices, id:\.self){ j in //search the user post
                            PostView(post: users[i].posts[j], loggedInfo: loggedInfo, profiles: profiles, users: users) //pass it in the home page
                        }
                    }
                    
                }
                .navigationTitle("BeMe")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarBackButtonHidden(true)
            }
        }
    }
}

#Preview {
    HomeView(loggedInfo: .constant([UserInfo(username: "", password: "", posts: [Post(userImage: "thieen", userName: "thieen", content: "Corgi iz da bezt", caption: "Like if you also like corgi!!!!!!", hasImage: false)])]), profiles: [], users: .constant([]))
}
