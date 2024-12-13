//
//  ListViewModel.swift
//  TodoList
//
//  Created by Abhijit Saha on 13/12/24.
//

import Foundation

class ListViewModel: ObservableObject {
    
    
    @Published var items: [ListModel] = []
    
    init() {
        getItems()
    }
    
    func getItems() {
        let newItems = [
            ListModel(title: "Go to the store", isCompleted: false),
            ListModel(title: "Buy Groceries", isCompleted: false),
            ListModel(title: "Read A Book", isCompleted: false),
        ]
        items.append(contentsOf: newItems)
    }
    
    func deleteItems(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
    
    func moveItems(from : IndexSet, to : Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String) {
        let newItem = [ListModel(title: title, isCompleted: false)]
        items.append(contentsOf: newItem)
    }
}
