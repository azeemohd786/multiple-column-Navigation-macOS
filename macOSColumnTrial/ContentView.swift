//
//  ContentView.swift
//  macOSColumnTrial
//
//  Created by Azeem Azeez on 21/05/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            // The first column is the sidebar.
            Sidebar()
            // Initial content of the second column.
             EmptyView()
            // Initial content for the third column.
            Text("Select a category of settings in the sidebar.")
        }
        .toolbar {
            ToolbarItem(placement: ToolbarItemPlacement.navigation) {
                Button {
                    
                } label: {
                    Label("Toggle sidebar", systemImage: "sidebar.left")
                }
            }
        }
    }
}

struct Sidebar: View {
    @ObservedObject var settingsCategories = CategoriesModel()
    @State private var selectedCategory: Category?
    var body: some View {
        List(settingsCategories.categories) { category in
            NavigationLink(
                    destination: SettingsListView(settingsCategory: category),
                    tag: category,
                    selection: $selectedCategory,
                    label: {
                        HStack {
                            Image(systemName: "folder")
                            Text(category.name)
                        }
            })
        }
        .listStyle(SidebarListStyle())
        .frame(minWidth: 200)
    }
}
// Second Column
struct SettingsListView: View {
    var settingsCategory: Category
    @ObservedObject var settingsModel: SettingsModel
    @State private var selectedSetting: Setting?
    init(settingsCategory: Category) {
        self.settingsCategory = settingsCategory
        settingsModel = SettingsModel(with: settingsCategory.name)
    }
    var body: some View {
        List(settingsModel.settings) { setting in
            NavigationLink(destination: SettingDetailsView(setting: setting),
                           tag: setting,
                           selection: $selectedSetting) {
                HStack {
                    Image(systemName: "gearshape")
                    Text(setting.name)
                }
            }
        }
        .navigationTitle(settingsCategory.name)
    }
    
}


// Third Column

struct SettingDetailsView: View {
    var setting: Setting
 
    var body: some View {
            Text(setting.value)
                .font(.title2)
                .padding(.horizontal)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
            ContentView()
    }
}
