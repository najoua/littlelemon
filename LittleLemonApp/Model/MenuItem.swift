//
//  MenuItem.swift
//  LittleLemonApp
//
//  Created by Najoua Mahi on 2023-03-03.
//

import Foundation

struct MenuItem: Decodable {
    var id: Int
    let title: String
    let price: String
    let image: String
}
