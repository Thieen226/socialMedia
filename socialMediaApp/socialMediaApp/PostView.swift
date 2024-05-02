//
//  PostView.swift
//  socialMediaApp
//
//  Created by StudentAM on 5/2/24.
//

import SwiftUI

struct PostView: View {
    @State var post: Post
    var body: some View {
        VStack{
            HStack{
                Image(post.userImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 50)
                    .clipShape(Circle())
                
                Text(post.userName)
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .padding(.leading, 0)
            }
            .padding(.trailing, 60 )
            
            Image(post.content)
                .resizable()
                .scaledToFit()
                .frame(height: 300)
                .clipShape(Rectangle())
            
            HStack (spacing: 16){
                Button{
                    print("Like Post")
                }label: {
                    Image(systemName: "heart")
                        .imageScale(.large)
                }
                Button{
                    print("Comment")
                }label: {
                    Image(systemName: "bubble.right")
                        .imageScale(.large)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
            }
            HStack {
                Text(post.userName)
                    .fontWeight(.semibold)
                Text(post.caption)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.footnote)
            
        }
        
    }
}

#Preview {
    PostView(post: Post(userImage: "johncena", userName: "John Cena", content: "youcantseeme", caption: "You can't see me", hasImage: true))
}
