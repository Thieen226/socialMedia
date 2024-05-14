//
//  AddPost.swift
//  socialMediaApp
//
//  Created by StudentAM on 5/10/24.
//

import SwiftUI

struct AddPost: View {
    @State var loggedIn: [UserInfo]
    var user : UserProfile
    @State var thoughts: String = ""
    @State var profiles : [UserProfile]
    
    var body: some View {
        VStack {
            HStack(spacing: -20){
                Image(user.userImg)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 130, height: 70)
                    .clipShape(Circle())
                
                Text(user.userName)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.footnote)
                    .fontWeight(.semibold)
                    
            }
            
            TextField("What's in your mind?", text: $thoughts)
                .padding()
                .padding(.top, -70)
                .frame(maxWidth: .infinity, maxHeight: 150)
            
            NavigationLink(destination: TabPage(user: user, loggedInfo: loggedIn, profiles: profiles), label:{
                Text("Add Post")
                    .frame(maxWidth: 100, maxHeight: 50)
                    .background(Color.blue)
                    .foregroundColor(Color.white)
                    .cornerRadius(8)
                    .padding()
            })
        }
    }
}


#Preview {
    AddPost(loggedIn: [], user: UserProfile(userName: "Thieen", userImg: "thieen", followers: 5, following: 2, post: 1, bio: "Corgi Forever"), profiles: [])
}
