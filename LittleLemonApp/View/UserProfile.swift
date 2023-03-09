//
//  UserProfile.swift
//  LittleLemonApp
//
//  Created by Najoua Mahi on 2023-03-03.
//

import SwiftUI

struct UserProfile: View {
    let firstName = UserDefaults.standard.string(forKey: kFirstName) ?? ""
    let lastName = UserDefaults.standard.string(forKey: kLastName) ?? ""
    let email = UserDefaults.standard.string(forKey: kEmail) ?? ""
    let phoneNumber = UserDefaults.standard.string(forKey: kPhoneNumber) ?? ""
    
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        VStack {
            Text("Personal information").padding()
            Image("profile-image").padding()
            Text(firstName).padding()
            Text(lastName).padding()
            Text(email).padding()
            Text(phoneNumber).padding()
            Button("Logout", action: {
                UserDefaults.standard.removeObject(forKey: kIsLoggedIn)
                self.presentation.wrappedValue.dismiss()
            })
            
            Spacer()
        }.padding(50)
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}
