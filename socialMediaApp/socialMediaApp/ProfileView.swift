//
//  ProfileView.swift
//  socialMediaApp
//
//  Created by StudentAM on 5/2/24.
//

import SwiftUI

struct ProfileView: View {
    @State var user : UserProfile
    @State var loggedIn : [UserInfo]
    @State var tabSelected : Int
    @State var isFollowed : Bool = false
    @State var users : [UserInfo]
    @State var profile : UserInfo
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack{
                    HStack{ //user img and their followers
                            Image(user.userImg)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 130, height: 70)
                                .clipShape(Circle())
                        
                        Spacer()
                        
                        HStack(spacing: 8){
                            VStack{
                                Text("\(profile.posts.count)") //user post
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                Text("Posts")
                                    .font(.footnote)
                            }
                            .frame(width: 72)
                            
                            VStack{
                                Text("\(user.followers)") //user followers
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                Text("Followers")
                                    .font(.footnote)
                            }
                            .frame(width: 72)
                            
                            
                            VStack{
                                Text("\(user.following)") //user following
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                Text("Following")
                                    .font(.footnote)
                            }
                            .frame(width: 72)
                        }
                        .padding(.horizontal)
                    }
                    VStack{ //name and bio
                        Text(user.userName)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.footnote)
                            .fontWeight(.semibold)
                        
                        Text(user.bio)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.footnote)
                        
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 1)
                    
                    if user.userName != loggedIn[0].posts[0].userName{ //check if the clicked username is not the same as the one logs in
                        Button(action: {
                            checkFollowers() //call this func to change the followers
                        }, label: {
                            Text(isFollowed ? "Unfollow" : "Follow")
                                .foregroundColor(.black)
                                .fontWeight(.semibold)
                                .frame(width: 360, height: 32)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 6)
                                        .stroke(.gray, lineWidth: 1)
                                )
                        })
                    }
                    
                    ForEach(profile.posts.indices, id: \.self){i in
                        if profile.posts[i].hasImage{
                            Image(profile.posts[i].content)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 370, height: .infinity)
                                .cornerRadius(6)
                                .clipShape(Rectangle())
                        }
                        else{
                            Text(profile.posts[i].content)
                                .frame(width: 370, height: 100)
                                .foregroundColor(.black)
                                .background(.gray.opacity(0.1))
                                .cornerRadius(6)

                        }
                    }
                    
                    Spacer()
                    
                }
                .navigationTitle("Profile")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
    func checkFollowers(){
        isFollowed.toggle() //change follow/unfollow button
        if(isFollowed && user.userName != loggedIn[0].posts[0].userName){
            user.followers += 1 //add 1 to the user when follow button is clicked
        }
        else{
            user.followers -= 1 //add 1 to the user when unfollow button is clicked
        }
    }
}

#Preview {
    ProfileView(user: UserProfile(userName: "Thieen", userImg: "thieen", followers: 5, following: 2, post: 1, bio: "Corgi Forever"), loggedIn: [UserInfo(username: "", password: "", posts: [Post(userImage: "thieen", userName: "Thieen", content: "Corgi iz da bezt", caption: "Like if you also like corgi!!!!!!", hasImage: false)])], tabSelected: 3, users: [], profile: UserInfo(username: "", password: "", posts: []))
}
