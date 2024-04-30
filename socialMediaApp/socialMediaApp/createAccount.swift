//
//  createAccount.swift
//  socialMediaApp
//
//  Created by StudentAM on 4/29/24.
//

import SwiftUI

struct createAccount: View {
    @State var name : String = ""
    @State var pass : String = ""
    @State var showPassword : Bool = false
    @Binding var newUser : [UserInfo]
    
    var body: some View {
        NavigationView{
           
            VStack{
                Text("Create an Account")
                    .font(Font.custom("MadimiOne-Regular", size: 40))
                    .fontWeight(.bold)
                TextField("Username", text: $name) //grab the username input
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .border(Color.black.opacity(0.1))
                    .cornerRadius(8)
                    .autocapitalization(.none)
               
                HStack{
                    if showPassword{ //if showPassword is true, then show it
                        TextField("Password", text: $pass) //grab the password input
                            .padding()
                            .background(Color.gray.opacity(0.1))
                            .border(Color.black.opacity(0.1))
                            .cornerRadius(8)
                            .autocapitalization(.none)
                    }
                    else{
                        SecureField("Password", text: $pass) //not letting users to see the password
                            .padding()
                            .background(Color.gray.opacity(0.1))
                            .border(Color.black.opacity(0.1))
                            .cornerRadius(8)
                            .autocapitalization(.none)
                    }
                    Button{
                        showPassword.toggle() //change showPassword to true to allow users see their passwords
                    }label: {
                        Image(systemName: showPassword ? "eye.slash" : "eye")
                    }
                    
                }
                .padding(.vertical)
                
                NavigationLink(destination: ContentView(), label: {
                    Text("Create")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .font(.system(size: 24))
                        .border(Color.black.opacity(0.1))
                        .cornerRadius(8)
                        .onTapGesture{
                            createUser()
                        }
                })
                
            }
            .padding()
            .navigationTitle("BeMe")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    func createUser(){
        
    }
}

#Preview {
    createAccount(newUser: .constant([]))
}
