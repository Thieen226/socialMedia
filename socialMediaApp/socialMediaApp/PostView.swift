//
//  PostView.swift
//  socialMediaApp
//
//  Created by StudentAM on 5/2/24.
//

import SwiftUI

struct UserProfile{
    var userName: String
    var userImg: String
    var followers: Int
    var following: Int
    var post: Int
    var bio: String
}

struct PostView: View {
    @State var post: Post
    @State var like: Bool = false
    @State var userFound: Bool = false
    @State private var profile : UserProfile = UserProfile(userName: "", userImg: "", followers: 0, following: 0, post: 0, bio: "")
    @State var loggedInfo : [UserInfo]
    
    @State private var profiles : [UserProfile] = [
        UserProfile(userName: "John Cena", userImg: "johncena", followers: 10, following: 5, post: 1, bio: "You can't see me"),
        UserProfile(userName: "The Rock", userImg: "therock", followers: 20, following: 8, post: 1, bio: "I am The Rock"),
        UserProfile(userName: "Thieen", userImg: "thieen", followers: 5, following: 2, post: 1, bio: "Corgi Forever")
    ]
    
    var body: some View {
        VStack{
            HStack{ //username and their profile img
                Image(post.userImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 40)
                    .clipShape(Circle())                   
                
                Button(post.userName, action: {
                    searchUser(userName: post.userName)
                })
                    .padding(.leading, -20)
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                
                NavigationLink(destination: ProfileView(user: profile, loggedIn: [], tabSelected: 1), isActive: $userFound){ //move to user profile page when login successed
                    EmptyView()
                }
                
                Spacer()
            }
            
            if post.hasImage{ //post img
                Image(post.content)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 370, height: .infinity)
                    .cornerRadius(6)
                    .clipShape(Rectangle())
                    
            }
            else{ //post text
                Text(post.content)
                    .padding(.horizontal, 10)
                    .frame(width: 370, height: 100, alignment: .leading)
                    .foregroundColor(.black)
                    .background(.gray.opacity(0.1))
                    .cornerRadius(6)
            }
            
            HStack (spacing: 16){ //like and comment buttons
                Button{
                    like.toggle()
                }label: {
                    Image(systemName: like ? "heart.fill" : "heart")
                        .imageScale(.large)
                        .foregroundColor(like ? .red : .black)
                        
                }
                Button{
                    print("Comment")
                }label: {
                    Image(systemName: "bubble.right")
                        .imageScale(.large)
                }
                
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 1)
            .padding(.leading, 10)
            .foregroundColor(.black)
            
            HStack { //username and caption
                Text(post.userName)
                    .fontWeight(.semibold)
                Text(post.caption)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.footnote)
            .padding(.top, 1)
            .padding(.leading, 10)

        }
        .padding(.bottom, 30)
    }
                               
    func searchUser(userName: String){
        for user in profiles{
            if user.userName == userName{
                profile = user
                userFound = true
            }
        }
    }
}

#Preview {
    PostView(post: Post(userImage: "johncena", userName: "John Cena", content: "youcantseeme", caption: "You can't see me", hasImage: true), loggedInfo: [])
}
