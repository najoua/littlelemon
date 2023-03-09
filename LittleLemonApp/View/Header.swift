//
//  Header.swift
//  LittleLemonApp
//
//  Created by Najoua Mahi on 2023-03-09.
//

import SwiftUI

struct Header: View {
    var body: some View {
        HStack {
            Image("Logo")
                .resizable()
                .lineLimit(1)
                .frame(width: 185, height: 40)
            Image("profile-image")
                .resizable()
                .lineLimit(1)
                .frame(width: 40, height: 40)
        }.padding()
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header()
    }
}
