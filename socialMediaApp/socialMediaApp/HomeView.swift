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
    @State private var posts: [Post] = [
        Post(userImage: "johncena", userName: "John Cena", content: "youcantseeme", caption: "You can't see me", hasImage: true),
        Post(userImage: "therock", userName: "The Rock", content: "therockPost", caption: "The sexy one is always on the right", hasImage: true),
        Post(userImage: "thieen", userName: "Thieen", content: "Corgi iz da bezt", caption: "Like if you also like corgi!!!!!!", hasImage: false)
    ]
    
    var body: some View {
        NavigationStack{
            ScrollView{
                LazyVStack{
                    ForEach(posts.indices, id:\.self){ i in
                        PostView(post: posts[i])
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
    HomeView()
}
