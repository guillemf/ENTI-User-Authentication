//
//  ViewModel.swift
//  UserAuthenticationTest
//
//  Created by Guillermo Fernandez on 06/05/2021.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var loggedIn: Bool = false
    @Published var loginButtonText = "Sign In With Firebase"
    
    public func login(_ username: String, password: String, remember: Bool) {
        // TODO: Add login with Firebase
        print("Login with firebase")
    }
    
    public func loginWithGoogle(_ remember: Bool) {
        // TODO: Add login with google
    }
    
    public func loginWithFacebook(_ remember: Bool) {
        // TODO: Add login with facebook
    }
}
