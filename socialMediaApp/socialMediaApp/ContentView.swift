//
//  ContentView.swift
//  socialMediaApp
//
//  Created by StudentAM on 4/26/24.
//

import SwiftUI

struct UserInfo: Hashable{ //struct that holds username and password
    var username: String
    var password: String
}
struct ContentView: View {
    @State private var loginUsers = [ //array of username and password
        UserInfo(username: "thieen", password: "12345"),
        UserInfo(username: "johncena", password: "0369"),
        UserInfo(username: "therock", password: "45689")
    ]
    //create variables
    @State var name: String = ""
    @State var pass: String = ""
    @State var showPassword: Bool = false
    @State var showView: Bool = false
    @State var loginValid: Bool = false
    @State var showToast: Bool = false
    
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
                .padding(.vertical) //add leading and trailing padding
                
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
                    
                
                NavigationLink(destination: HomeView(), isActive: $showView){
                    EmptyView()
                }
                Text("OR")
                    .padding(.top, 25)
                    .padding(.bottom, 20)
                
                NavigationLink(destination: createAccount(newUser : $loginUsers), label: {
                    Text("Create an Account")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .font(.system(size: 24))
                        .border(Color.black.opacity(0.1))
                        .cornerRadius(8)
                })
            }
        }
        .padding()
        
        .alert(isPresented: $showToast) {
            Alert(
                title: Text("Login Failed"),
                message: Text("Your username or password is wrong")
            )
        }
    }
    
    func checkUserInfo(){
        if !name.isEmpty && !pass.isEmpty{
            for info in loginUsers{
                if info.username == name && info.password == pass{
                    loginValid = true
                    break
                }
                else{
                    loginValid = false
                }
            }
            if loginValid{
                showView = true
            }
            else{
                showToast = true
            }
        }
    }
}

#Preview {
    ContentView()
}
