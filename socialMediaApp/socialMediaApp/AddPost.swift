//
//  AddPost.swift
//  socialMediaApp
//
//  Created by StudentAM on 5/10/24.
//

import SwiftUI

struct AddPost: View {
    @Binding var loggedIn: UserInfo
    var user : UserProfile
    @State var thoughts: String = ""
    @State var caption: String = ""
    @Binding var users: [UserInfo]
    @State var showToast = false
    @State var alertTitle: String = ""
    @State var alertMessage: String = ""
    @State var isPostAdded: Bool = false
    
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
                .border(Color.black)
            
            TextField("Write a caption", text: $caption)
                .padding()
                .cornerRadius(8)
            
            Button(action: {
                createPost()
            }, label: {
                Text("Add Post")
                    .frame(maxWidth: 100, maxHeight: 50)
                    .background(Color.blue)
                    .foregroundColor(Color.white)
                    .cornerRadius(8)
                    .padding()
            })
        }
        
        
        .alert(isPresented: $showToast){
            Alert(
                title: Text(alertTitle),
                message: Text(alertMessage)
            )
        }
    }
    func createPost(){
        if thoughts.isEmpty && caption.isEmpty{
            showToast = true
            alertTitle = "No post is uploaded!"
            alertMessage = "Please write something"
        }
        else{
            showToast = false
            let newPost = Post(userImage: user.userImg, userName: user.userName, content: thoughts, caption: caption, hasImage: false)
            for i in users.indices{
                if users[i].username == user.userName{
                    users[i].posts.append(newPost)
                    loggedIn.posts.append(newPost)
                    alertTitle = "Post uploaded!"
                    alertMessage = "Your post has been uploaded."
                    isPostAdded = true
                    break
                }
            }
        }
        thoughts = ""
        caption = ""
        showToast = true
        
//        if (isPostAdded){
//            user.post += 1
//        }
    }
}


#Preview {
    AddPost(loggedIn: .constant(UserInfo(username: "", password: "", posts: [Post(userImage: "thieen", userName: "thieen", content: "Corgi iz da bezt", caption: "Like if you also like corgi!!!!!!", hasImage: false)])), user: UserProfile(userName: "Thieen", userImg: "thieen", followers: 5, following: 2, post: 1, bio: "Corgi Forever"), users: .constant([]))
}
