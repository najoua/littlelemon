//
//  Hero.swift
//  LittleLemonApp
//
//  Created by Najoua Mahi on 2023-03-09.
//

import SwiftUI

struct Hero: View {
    @Binding var searchText: String
    
    var body: some View {
        
     VStack {
         Text("Little Lemon")
             .frame(maxWidth: .infinity, alignment: .leading)
             .padding(5)
             .foregroundColor(Color("Primary2"))
             .font(.largeTitle)
         Text("Chicago")
             .frame(maxWidth: .infinity, alignment: .leading)
             .padding(5)
             .foregroundColor(.white)
             .font(.title)
         HStack {
             Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
                 .foregroundColor(.white)
                 .lineLimit(4)
                 .fixedSize(horizontal: false, vertical: true)
             Image("HeroImage")
                 .resizable()
                 .frame(width: 100, height: 150)
         }
         TextField("Search menu", text: $searchText)
             .autocorrectionDisabled(true)
             .textFieldStyle(.roundedBorder)
             .padding()
             .cornerRadius(8)
             .padding(.horizontal)
     }.background(Color("Primary1"))
    }
}

struct Hero_Previews: PreviewProvider {
    static var previews: some View {
        Hero(searchText: .constant(""))
    }
}
