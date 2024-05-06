//
//  PostView.swift
//  socialMediaApp
//
//  Created by StudentAM on 5/2/24.
//

import SwiftUI

struct PostView: View {
    @State var post: Post
    @State var like: Bool = false
    var body: some View {
        VStack{
            HStack{ //username and their profile img
                Image(post.userImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 40)
                    .clipShape(Circle())
                
                Text(post.userName)
                    .padding(.leading, -20)
                    .font(.footnote)
                    .fontWeight(.semibold)
                
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
}

#Preview {
    PostView(post: Post(userImage: "johncena", userName: "John Cena", content: "youcantseeme", caption: "You can't see me", hasImage: true))
}
