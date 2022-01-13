//
//  ContentView.swift
//  DemoProject
//
//  Created by hamza on 1/11/22.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Propertiers
    @State private var email = ""
    @State private var username = ""
    @State private var password = ""
    @State private var showPassword = false
    
    var body: some View {
        
        ZStack(alignment: .top) {
            VStack {
                Image("edvora-image")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 250,height: 60, alignment: .center)
                    .clipped()
                    .frame(minWidth: 0, maxWidth: 200, minHeight: 0, maxHeight: 200, alignment: .top)
                
                //MARK: - UserField
                ZStack {
                    Image("username-Field")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipped()
                    
                    HStack {
                        Image("profile-image")
                            .foregroundColor(.secondary)
                        VStack {
                            TextField("Username",
                                      text: $username)
                        }
                    }
                    .padding()
                    .background(Capsule().fill(Color.clear))
                }
                
                //MARK: - Password Field
                
                ZStack {
                    Image("password-Field")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(minWidth: 0, maxWidth: .infinity)
                    
                    HStack {
                        Image("key-image")
                            .foregroundColor(.secondary)
                        if showPassword {
                            TextField("",
                                      text: $password)
                        } else {
                            SecureField("",
                                        text: $password)
                        }
                        
                        Button(action: { self.showPassword.toggle()}) {
                            
                            Image("show-pass")
                                .foregroundColor(.secondary)
                        }
                    }
                    .padding()
                    .background(Capsule().fill(Color.clear))
                }
                
                //MARK: - Email Field
                
                ZStack {
                    Image("email-Field")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(minWidth: 0, maxWidth: .infinity)
                    
                    HStack {
                        Image("email-image")
                            .foregroundColor(.secondary)
                        
                        TextField("",
                                  text: $email)
                    }   .padding()
                        .background(Capsule().fill(Color.clear))
                }
                //Forget Label
                HStack {
                    Text("Forget Password").foregroundColor(Color(hex: "#BF9B9B")).multilineTextAlignment(.trailing)
                }
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .topTrailing)
                
                //MARK: - Button and SignUp(Label)
                
                
                VStack(spacing: 20) {
                    Button(action: {}) {
                        Text("Sign In")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 300, height: 50)
                            .background(Color(hex: "#733D47"))
                            .cornerRadius(15.0)
                    }
                    
                    HStack {
                        Text("Don’t have an account?").foregroundColor(Color(hex: "#959595"))
                        Text("Sign up").foregroundColor(Color(hex: "#BF9B9B"))
                    }
                }.frame(minWidth: 100, maxWidth: .infinity, minHeight: 110, maxHeight: 200, alignment: .bottom)
            }
        }
        .onTapGesture {
            endEditing()
        }
        .padding()
    }
}

// Hide Keyboard
private func endEditing() {
    UIApplication.shared.endEditing()
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


extension UIApplication {
    func endEditing() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)    }
}
