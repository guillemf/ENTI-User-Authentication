//
//  ContentView.swift
//  UserAuthenticationTest
//
//  Created by Guillermo Fernandez on 06/05/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var saveLogin: Bool = false
    
    @ObservedObject var viewModel: ViewModel = ViewModel()
    
    var body: some View {
        VStack {
            GeometryReader { geo in
                Image("Logo_ENTI")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: geo.size.width)
            }.frame(height: 75)
            .padding()
            VStack {
                TextField("User name", text: $username)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                SecureField("Password", text: $password)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                HStack {
                    CheckView(isChecked: saveLogin, title: "Save Login")
                    Spacer()
                }.padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))

                GeometryReader { geo in
                    Button("Login") {
                        viewModel.login(username, password: password, remember: saveLogin)
                    }.frame(width: geo.size.width,
                            height: 50,
                            alignment: .center)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(5.0)
                    .disabled((username.count < 5) || (password.count < 8))
                }.frame(height: 25)
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 40, trailing: 20))
                GeometryReader { geo in
                    Button(action: {
                        viewModel.loginWithGoogle(saveLogin)
                    }){
                        HStack(spacing: 10) {
                            Image("Google-Logo")
                                .resizable()
                                .frame(width: 40, height: 40, alignment: .center)
                                .background(Color.white)
                            Text("Login with Google")
                        }
                    }
                    .frame(width: geo.size.width,
                            height: 50,
                            alignment: .center)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(5.0)
                    .disabled((username.count < 5) || (password.count < 8))
                }.frame(height: 25)
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 20))
                GeometryReader { geo in
                    Button(action: {
                        viewModel.loginWithFacebook(saveLogin)
                    }){
                        HStack(spacing: 10) {
                            Image("Facebook-Logo")
                                .resizable()
                                .frame(width: 40, height: 40, alignment: .center)
                            Text("Login with Facebook")
                        }
                    }
                    .frame(width: geo.size.width,
                            height: 50,
                            alignment: .center)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(5.0)
                    .disabled((username.count < 5) || (password.count < 8))
                }
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 20))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CheckView: View {
   @State var isChecked:Bool = false
    
   var title:String
    
   func toggle(){isChecked = !isChecked}
    
   var body: some View {
       Button(action: toggle){
           HStack{
               Image(systemName: isChecked ? "checkmark.square": "square")
               Text(title)
                .font(.caption)
           }
       }
   }
}
