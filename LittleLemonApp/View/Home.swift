//
//  Home.swift
//  LittleLemonApp
//
//  Created by Najoua Mahi on 2023-03-03.
//

import SwiftUI

struct Home: View {
    let persistenceController = PersistenceController.shared
    
    var body: some View {
        TabView {
            Menu().tabItem{
                Label("Menu", systemImage: "list.dash")
            }.environment(\.managedObjectContext, persistenceController.container.viewContext)
            
            UserProfile().tabItem({
                Label("Profile", systemImage: "square.and.pencil")
            })
        }.navigationBarBackButtonHidden(true)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
