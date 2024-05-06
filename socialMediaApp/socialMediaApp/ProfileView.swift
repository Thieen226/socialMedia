//
//  ProfileView.swift
//  socialMediaApp
//
//  Created by StudentAM on 5/2/24.
//

import SwiftUI
struct UserProfile: Hashable{
    var userName: String
    var userImg: String
    var followers: Int
    var following: Int
    var post: Int
    var bio: String
}
struct ProfileView: View {
    @State private var profiles = [
        UserProfile(userName: "John Cena", userImg: "johncena", followers: 10, following: 5, post: 1, bio: "You can't see me"),
        UserProfile(userName: "The Rock", userImg: "therock", followers: 20, following: 8, post: 1, bio: "I am The Rock"),
        UserProfile(userName: "Thieen", userImg: "thieen", followers: 5, following: 2, post: 1, bio: "Corgi Forever")
    ]
    
    var body: some View {
        NavigationStack{
            VStack{
                HStack{ //user img and their followers
                    Image(profiles[0].userImg)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 130, height: 70)
                        .clipShape(Circle())

                    Spacer()
                    
                    HStack(spacing: 8){
                        VStack{
                            Text("\(profiles[0].post)")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                            Text("Posts")
                                .font(.footnote)
                        }
                        .frame(width: 72)
                                
                        VStack{
                            Text("\(profiles[0].followers)")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                            Text("Followers")
                                .font(.footnote)
                        }
                        .frame(width: 72)
                        
                        
                        VStack{
                            Text("\(profiles[0].following)")
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
                    Text(profiles[0].userName)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.footnote)
                        .fontWeight(.semibold)
                    
                    Text(profiles[0].bio)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.footnote)
                        
                }
                .padding(.horizontal, 20)
                .padding(.top, 1)
                
                Button("Edit profile", action: {
                    
                })
                .frame(maxWidth: 350, maxHeight: 32)
                .foregroundColor(.black)
                .overlay(
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(.gray, lineWidth: 1)
                )
                
                Spacer()
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ProfileView()
}
