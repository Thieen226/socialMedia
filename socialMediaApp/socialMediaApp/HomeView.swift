//
//  HomeView.swift
//  socialMediaApp
//
//  Created by StudentAM on 4/29/24.
//

import SwiftUI

struct Post{
    var userImage: String
    var userName: String
    var content: String
    var caption: String
    var hasImage: Bool
}
struct HomeView: View {
    @State private var posts: [Post] = [
        Post(userImage: "johncena", userName: "John Cena", content: "youcantseeme", caption: "You can't see me", hasImage: true),
        Post(userImage: "therock", userName: "The Rock", content: "therockPost", caption: "Look at this boy", hasImage: false),
        Post(userImage: "thieen", userName: "Thieen", content: "corgiPost", caption: "Corgi iz da bezt", hasImage: true)
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
            }
        }
    }
}

#Preview {
    HomeView()
}
