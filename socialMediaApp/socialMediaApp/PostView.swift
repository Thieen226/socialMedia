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

//create variables
struct PostView: View {
    @State var post: Post
    @State var like: Bool = false
    @State var userFound: Bool = false
    @State private var profile : UserProfile = UserProfile(userName: "", userImg: "", followers: 0, following: 0, post: 0, bio: "")
    @State var loggedInfo : [UserInfo]
    @State var profiles : [UserProfile]
    @State var users : [UserInfo]
    @State var userInfo : UserInfo = UserInfo(username: "", password: "", posts: [Post(userImage: "", userName: "", content: "", caption: "", hasImage: false)])

    
    var body: some View {
        VStack{
            HStack{ //username and their profile img
                Image(post.userImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 40)
                    .clipShape(Circle())                   
                
                Button(post.userName, action: { //when the user click on the one of the other usernames, it will go to their profile page
                    searchUser(userName: post.userName)
                })
                    .padding(.leading, -20)
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                
                NavigationLink(destination: ProfileView(user: profile, loggedIn: loggedInfo, tabSelected: 1, users: users, profile: userInfo), isActive: $userFound){ //move to user profile page when login successed
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
                Button{ //comment button
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
        for user in profiles{ //search the user in the UserProfile
            if user.userName == userName && user.userName != loggedInfo[0].username{ //check if the clicked username same as the username in the array and it is not the one who logs in
                profile = user //pass the data from the profile to user
                userFound = true
            }
        }
        for i in users.indices{
            if userName == users[i].username{
                userInfo = users[i]
            }
        }
    }
}

#Preview {
    PostView(post: Post(userImage: "johncena", userName: "John Cena", content: "youcantseeme", caption: "You can't see me", hasImage: true), loggedInfo: [], profiles: [], users: [UserInfo(username: "", password: "", posts: [Post(userImage: "thieen", userName: "thieen", content: "Corgi iz da bezt", caption: "Like if you also like corgi!!!!!!", hasImage: false)])])
}
