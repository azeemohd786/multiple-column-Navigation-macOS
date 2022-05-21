//
//  File.swift
//  macOSColumnTrial
//
//  Created by Azeem Azeez on 21/05/22.
//

import Foundation
import SwiftUI
 
struct Category: Identifiable, Hashable {
    var id = UUID().uuidString
    var name: String
}
 
 
struct Setting: Identifiable, Hashable {
    var id = UUID().uuidString
    var name: String
    var value: String {
        [
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
            "Pretium viverra suspendisse potenti nullam ac tortor vitae purus.",
            "Laoreet suspendisse interdum consectetur libero id faucibus nisl.",
            "Faucibus et molestie ac feugiat sed lectus vestibulum.",
            "Faucibus et molestie ac feugiat sed lectus vestibulum."
        ][Int.random(in: 0..<5)]
    }
}
 
 
class CategoriesModel: ObservableObject {
    @Published var categories: [Category] = [Category(name: "iPhone"),
                                             Category(name: "Tablet"),
                                             Category(name: "iPad"),
                                             Category(name: "Color Theme")
    ]
}
 
 
class SettingsModel: ObservableObject {
    @Published var settings = [Setting]()
    
    init(with category: String) {
        switch category {
            case "iPhone":
                settings = [Setting(name: "iPhone 11"), Setting(name: "iPhone 12"),
                            Setting(name: "iPhone Pro max"), Setting(name: "iPhone 12"), Setting(name: "iPhone 13")]
                
            case "Tablet":
                settings = [Setting(name: "Apple iPad Pro 11 2021 Tablet "), Setting(name: "Apple iPad Mini 2019 "),
                            Setting(name: "Apple iPad Mini 2019 "), Setting(name: "Apple iPad 9th Gen 10.2 2021 "),
                            Setting(name: "Apple iPad Air 5th Gen 5G Tablet"), Setting(name: "Apple iPad Pro 11 2021 Tablet")]
                
            case "iPad":
                settings = [Setting(name: "Standard iPad"), Setting(name: "iPad Mini"),
                            Setting(name: "iPad Air"), Setting(name: "iPad Pro")]
                
            case "Color Theme":
                settings = [Setting(name: "Red"), Setting(name: "Yellow"),
                            Setting(name: "White"), Setting(name: "Black"),
                            Setting(name: "Gold")]
                
            default: break
        }
    }
}
