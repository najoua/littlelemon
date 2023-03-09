//
//  BreakDownMenu.swift
//  LittleLemonApp
//
//  Created by Najoua Mahi on 2023-03-09.
//

import SwiftUI

struct BreakDownMenu: View {
    let breakdownMenuTitles = ["Starters", "Mains", "Desserts", "Drinks"]
    var body: some View {
        VStack {
            Text("Order for delivery!")
                .frame(maxWidth: .infinity, alignment: .leading)
                .textCase(.uppercase)
            ScrollView(.horizontal) {
                HStack(spacing: 20) {
                    ForEach(breakdownMenuTitles, id:\.self) { title in
                        Button(title, action: {
                            
                        })
                        .foregroundColor(.black)
                        .frame(width: 100, height: 40)
                        .background(Color("Secondary3"))
                        .cornerRadius(8)
                    }
                }
            }
        }
    }
    
    struct BreakDownMenu_Previews: PreviewProvider {
        static var previews: some View {
            BreakDownMenu()
        }
    }
}
