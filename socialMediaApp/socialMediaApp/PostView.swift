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
            HStack{
                Image(post.userImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 40)
                    .clipShape(Circle())
                
                Text(post.userName)
                    .font(.footnote)
                    .fontWeight(.semibold)
                
                Spacer()
            }
            
            if post.hasImage{
                Image(post.content)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 370, height: .infinity)
                    .cornerRadius(6)
                    .clipShape(Rectangle())
                    
            }
            else{
                Text(post.content)
                    .frame(width: 370, height: 100, alignment: .leading)
                    .foregroundColor(.black)
                    .background(.gray.opacity(0.1))
                    .cornerRadius(6)
                    .padding(.leading, 1)
            }
            
            HStack (spacing: 16){
                Button{
                    like.toggle()
                }label: {
                    Image(systemName: like ? "heart.fill" : "heart")
                        .imageScale(.large)
                        .foregroundColor(.red)
                        
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
            .padding(.leading, 5)
            .foregroundColor(.black)
            
            HStack {
                Text(post.userName)
                    .fontWeight(.semibold)
                Text(post.caption)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.footnote)
            .padding(.top, 1)
            .padding(.leading, 5)
        }
        .padding(.top, 50)
    }
}

#Preview {
    PostView(post: Post(userImage: "johncena", userName: "John Cena", content: "youcantseeme", caption: "You can't see me", hasImage: true))
}
