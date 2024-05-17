//
//  createAccount.swift
//  socialMediaApp
//
//  Created by StudentAM on 4/29/24.
//

import SwiftUI

struct createAccount: View {
    @State var newName : String = ""
    @State var newPass : String = ""
    @State var showPassword : Bool = false
    @State var showToast : Bool = false
    @State var showView : Bool = false
    @Binding var newUser : [UserInfo] //modify the UserInfo array by adding newUser
    @Environment(\.presentationMode) var presentationMode //control the presentation mode of the current page
    
    var body: some View {
        NavigationView{
           
            VStack{
                Text("Create an Account")
                    .font(Font.custom("MadimiOne-Regular", size: 40))
                    .fontWeight(.bold)
                TextField("Username", text: $newName) //grab the username input
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(.gray, lineWidth: 0.5)
                    )
                    .autocapitalization(.none)
               
                HStack{
                    if showPassword{ //if showPassword is true, then show it
                        TextField("Password", text: $newPass) //grab the password input
                            .padding()
                            .background(Color.gray.opacity(0.1))
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(.gray, lineWidth: 0.5)
                            )
                            .autocapitalization(.none)
                    }
                    else{
                        SecureField("Password", text: $newPass) //not letting users to see the password
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

            
            .alert(isPresented: $showToast){ //show alert when the the password or username is empty
                Alert(
                    title: Text("Create Failed"),
                    message: Text("Enter your username or password!"))
            }
        }
    }
    func createUser(){
        if newName.isEmpty || newPass.isEmpty{ //if name or pass is empty, show alert
            showToast = true
        }
        else{
            showToast = false
            let newAccount = UserInfo(username: newName, password: newPass, posts: []) //create variable to hold new user info
            newUser.append(newAccount) //append newAccount to UserInfo
            presentationMode.wrappedValue.dismiss() //dismisses the current page
            showView = true
          

        }
    }
}

#Preview {
    createAccount(newUser: .constant([]))
}
