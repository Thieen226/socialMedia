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

    
    let gridItems = [
        GridItem(.fixed(120), spacing: 10, alignment: nil),
        GridItem(.fixed(120), spacing: 10, alignment: nil),
        GridItem(.fixed(120), spacing: 10, alignment: nil)
     ]
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack{
                    HStack{ //user img and their followers
                         
                        if loggedIn.count != 0 {
                            Image(user.userImg)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 130, height: 70)
                                .clipShape(Circle())
                        }
                        else{
                            Image(user.userImg)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 130, height: 70)
                                .clipShape(Circle())
                        }
                        
                        Spacer()
                        
                        HStack(spacing: 8){
                            VStack{
                                Text("\(user.post)")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                Text("Posts")
                                    .font(.footnote)
                            }
                            .frame(width: 72)
                            
                            VStack{
                                Text("\(user.followers)")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                Text("Followers")
                                    .font(.footnote)
                            }
                            .frame(width: 72)
                            
                            
                            VStack{
                                Text("\(user.following)")
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
                    
                    if user.userName != loggedIn[0].posts[0].userName{
                        Button(action: {
                            checkFollowers()
                        }, label: {
                            Text( isFollowed ? "Unfollow" : "Following")
                                .foregroundColor(.black)
                        })
                    }
                    
                    LazyVGrid(columns: gridItems, spacing: 2){
                        ForEach(loggedIn[0].posts, id: \.self){post in
                            Text(post.content)
                                .padding()
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
        isFollowed.toggle()
        if(isFollowed && user.userName != loggedIn[0].posts[0].userName){
            user.following += 1
            print("fd")
        }
        else{
            user.following -= 1
        }
    }
}

#Preview {
    ProfileView(user: UserProfile(userName: "Thieen", userImg: "thieen", followers: 5, following: 2, post: 1, bio: "Corgi Forever"), loggedIn: [UserInfo(username: "", password: "", posts: [Post(userImage: "thieen", userName: "Thieen", content: "Corgi iz da bezt", caption: "Like if you also like corgi!!!!!!", hasImage: false)])], tabSelected: 3
    )
}
