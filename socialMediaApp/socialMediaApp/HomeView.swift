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
        Post(userImage: "therock", userName: "The Rock", content: "therockPost", caption: "Look at this boy", hasImage: true),
        Post(userImage: "thieen", userName: "Thieen", content: "corgiPost", caption: "Corgi iz da bezt", hasImage: true)
    ]
    
    var body: some View {
        NavigationView{
            VStack{
                
            }
            
            .navigationTitle("BeMe")
            .navigationBarTitleDisplayMode(.inline)
        }
        TabView{
            Text("Home")
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
    HomeView()
}
