//
//  ListViewModel.swift
//  TodoList
//
//  Created by Abhijit Saha on 13/12/24.
//

import Foundation

class ListViewModel: ObservableObject {
    
    
    @Published var items: [ItemModel] = []
    
    init() {
        getItems()
    }
    
    func getItems() {
        let newItems = [
            ItemModel(title: "Go to the store", isCompleted: false),
            ItemModel(title: "Buy Groceries", isCompleted: false),
            ItemModel(title: "Read A Book", isCompleted: false),
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
        let newItem = [ItemModel(title: title, isCompleted: false)]
        items.append(contentsOf: newItem)
    }
    
    func updateItem(item: ItemModel) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.updateCompletion()
        }
    }
}
