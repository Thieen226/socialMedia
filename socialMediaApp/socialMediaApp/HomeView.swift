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
    var users : [UserInfo]
    
//    @State private var posts: [Post] = [
//        Post(userImage: "johncena", userName: "John Cena", content: "youcantseeme", caption: "You can't see me", hasImage: true),
//        Post(userImage: "therock", userName: "The Rock", content: "therockPost", caption: "The sexy one is always on the right", hasImage: true),
//        Post(userImage: "thieen", userName: "Thieen", content: "Corgi iz da bezt", caption: "Like if you also like corgi!!!!!!", hasImage: false)
//    ]
    
    var body: some View {
        NavigationStack{
            ScrollView{
                LazyVStack{
                    ForEach(users.indices, id:\.self){ i in
                        ForEach(users[i].posts.indices, id:\.self){ j in
                            PostView(post: users[i].posts[j], loggedInfo: loggedInfo, profiles: profiles)
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
    HomeView(loggedInfo: .constant([UserInfo(username: "", password: "", posts: [Post(userImage: "thieen", userName: "thieen", content: "Corgi iz da bezt", caption: "Like if you also like corgi!!!!!!", hasImage: false)])]), profiles: [], users: [])
}
