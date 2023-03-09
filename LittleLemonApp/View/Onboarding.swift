//
//  Onboarding.swift
//  LittleLemonApp
//
//  Created by Najoua Mahi on 2023-03-03.
//

let kFirstName = "first name key"
let kLastName = "last name key"
let kEmail = "email key"
let kPhoneNumber = "phone number"
let kIsLoggedIn = "kIsLoggedIn"

import SwiftUI

struct Onboarding: View {
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var email: String = ""
    @State var phoneNumber: String = ""
    @State var isLoggedIn = false
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: Home(), isActive: $isLoggedIn) {
                    EmptyView()
                }
                TextField("First Name", text: $firstName).padding()
                TextField("Last Name", text: $lastName).padding()
                TextField("Email", text: $email).padding()
                TextField("Phone number", text: $phoneNumber).padding()
                Button("Register", action: {
                    if !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty {
                        UserDefaults.standard.set(firstName, forKey: kFirstName)
                        UserDefaults.standard.set(lastName, forKey: kLastName)
                        UserDefaults.standard.set(email, forKey: kEmail)
                        UserDefaults.standard.set(phoneNumber, forKey: kPhoneNumber)
                        UserDefaults.standard.set(true, forKey: kIsLoggedIn)
                    } else {
                        
                    }
                    
                    isLoggedIn = true
                }).padding()
            }.onAppear(perform: {
                if UserDefaults.standard.bool(forKey: kIsLoggedIn) {
                    isLoggedIn = true
                }
            }).padding(20)
        }
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
