//
//  ProfileView.swift
//  socialMediaApp
//
//  Created by StudentAM on 5/2/24.
//

import SwiftUI

struct ProfileView: View {
    @State var user : UserProfile
    
    var body: some View {
        NavigationStack{
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
    ProfileView(user: UserProfile(userName: "Thieen", userImg: "thieen", followers: 5, following: 2, post: 1, bio: "Corgi Forever"))
}
