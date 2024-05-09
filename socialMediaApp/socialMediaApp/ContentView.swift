//
//  ContentView.swift
//  socialMediaApp
//
//  Created by StudentAM on 4/26/24.
//

import SwiftUI

struct UserInfo{ //struct that holds username and password
    var username: String
    var password: String
    var posts: [Post]
}
struct ContentView: View {
    @State private var loginUsers = [ //array of username and password
        UserInfo(username: "thieen", password: "12345", posts: [
            Post(userImage: "thieen", userName: "Thieen", content: "Corgi iz da bezt", caption: "Like if you also like corgi!!!!!!", hasImage: false)
        ]),
        UserInfo(username: "johncena", password: "0369", posts: [
            Post(userImage: "johncena", userName: "John Cena", content: "youcantseeme", caption: "You can't see me", hasImage: true)
        ]),
        UserInfo(username: "therock", password: "45689", posts: [
            Post(userImage: "thieen", userName: "Thieen", content: "Corgi iz da bezt", caption: "Like if you also like corgi!!!!!!", hasImage: false)
        ])
    ]
    //create variables
    @State var name: String = ""
    @State var pass: String = ""
    @State var showPassword: Bool = false
    @State var showView: Bool = false
    @State var loginValid: Bool = false
    @State var showToast: Bool = false
    @State var loggedInUser : [UserInfo] = [] //keep track who logins
    
    var body: some View {
        NavigationView{
            VStack{
                Text("BeMe")
                    .font(Font.custom("MadimiOne-Regular", size: 80)) //add font
                    .foregroundColor(.blue)
                Text("Welcome!")
                    .font(Font.custom("MadimiOne-Regular", size: 30))
                    .fontWeight(.bold)
                TextField("Username", text: $name) //grab the username input
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(.gray, lineWidth: 0.5)
                    )
                    .autocapitalization(.none) //turn off the auto capitalize
                    .padding()
                
                HStack{
                    if showPassword{ //if showPassword is true, then show it
                        TextField("Password", text: $pass) //grab the password input
                            .background(Color.gray.opacity(0.1))
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(.gray, lineWidth: 0.5)
                            )
                            .autocapitalization(.none)
                    }
                    else{
                        SecureField("Password", text: $pass) //not letting users to see the password
                            .padding()
                            .background(Color.gray.opacity(0.1))
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(.gray, lineWidth: 0.5)
                            )
                            .autocapitalization(.none)
                    }
                    Button{
                        showPassword.toggle() //change showPassword to true to allow users see their passwords
                    }label: {
                        Image(systemName: showPassword ? "eye" : "eye.slash")
                    }
                }
                .padding(.horizontal)
                
                Button("Log in", action: {
                    checkUserInfo()
                }) 
                .disabled(pass.isEmpty) //disable the log in button when no password is entered
                .padding()
                .frame(maxWidth: .infinity)
                .background(pass.isEmpty ? Color.gray : Color.blue) //change the background of log in button
                .foregroundColor(.white)
                .font(.system(size: 24))
                .border(Color.black.opacity(0.1))
                .cornerRadius(8)
                .padding()
                
                NavigationLink(destination: TabPage(user: UserProfile(userName: "John Cena", userImg: "johncena", followers: 10, following: 5, post: 1, bio: "You can't see me")), isActive: $showView){ //move to home page when login successed
                    EmptyView()
                }
                Text("OR")
                    .padding(.top, 25)
                    .padding(.bottom, 20)
                
                Text("Don't have an account")
                    .font(.system(size: 24))
                    .padding()
                
                NavigationLink(destination: createAccount(newUser : $loginUsers), label: { //move to create account page
                    Text("Create HERE")
                        .underline(true)
                })
            }
            .navigationBarBackButtonHidden(true)
        }
        
        .alert(isPresented: $showToast) {
            Alert(
                title: Text("Login Failed"),
                message: Text("Your username or password is wrong")
            )
        }
    }
    
    func checkUserInfo(){
        if !name.isEmpty || !pass.isEmpty{ //check if username or password input is empty
            for info in loginUsers{
                if info.username == name && info.password == pass{ //check if the name and password input is correct
                    loginValid = true
                    loggedInUser.append(info)
                    print(loggedInUser)
                    break
                }
                else{
                    loginValid = false
                }
            }
            //reset the username and password input
            
            
            if loginValid{ //if login is valid then change showView to true to move to home page
                name = ""
                pass = ""
                showView = true
                
            }
            else{ //if invalid show alert
                showToast = true
                name = ""
                pass = ""
            }
        }
    }
}

#Preview {
    ContentView()
}
