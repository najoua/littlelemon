//
//  Menu.swift
//  LittleLemonApp
//
//  Created by Najoua Mahi on 2023-03-03.
//

import SwiftUI

struct Menu: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @State var searchText = ""
    
    var body: some View {
        VStack {
            Header().frame(maxWidth: .infinity, alignment: .trailing)
            Hero(searchText: $searchText)
            BreakDownMenu().padding()

            FetchedObjects(
                predicate: buildPredicate(),
                sortDescriptors: buildSortDescriptors()) { (dishes: [Dish]) in
                    List {
                        ForEach(dishes, id:\.self) { dish in
                            HStack {
                                let title = dish.title ?? ""
                                let price = dish.price ?? ""
                                Text("\(title): \(price)$")
                                if let url = dish.image {
                                    AsyncImage(url: URL(string: url)) { phase in
                                        phase.image?.resizable()
                                    }.frame(width: 60, height: 60)
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                }
                            }
                        }
                    }
                }
        }.task {
            do {
                try await getMenuData()
            } catch {
                print("Error!!\(error.localizedDescription)")
            }
        }
    }
    
    func getMenuData() async throws {
        PersistenceController.shared.clear()
        let url = URL(string: "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json")
        guard let url = url else {
            return
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        let fullMenu = try JSONDecoder().decode(MenuList.self, from: data)
        
        for menu in fullMenu.menu {
            let dish = Dish(context: viewContext)
            dish.id = Int16(menu.id)
            dish.title = menu.title
            dish.image = menu.image
            dish.price = menu.price
        }
        
        try? viewContext.save()
    }
    
    func buildSortDescriptors() -> [NSSortDescriptor] {
        [NSSortDescriptor(key: "title",
                          ascending: true,
                          selector:
                            #selector(NSString.localizedStandardCompare))]
    }
    
    func buildPredicate() -> NSPredicate {
        return searchText == "" ?
        NSPredicate(value: true) :
        NSPredicate(format: "title CONTAINS[cd] %@", searchText)
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
