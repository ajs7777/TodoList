//
//  ListViewModel.swift
//  TodoList
//
//  Created by Abhijit Saha on 13/12/24.
//

import Foundation

class ListViewModel: ObservableObject {
    
    
    @Published var items: [ItemModel] = [] {
        didSet {
            saveItems()
        }
    }
    
    let itemsKey: String = "items_list"
    
    init() {
        getItems()
    }
    
    func getItems() {
        
        guard let decodedData = UserDefaults.standard.data(forKey: itemsKey),
                let saveditems = try? JSONDecoder().decode([ItemModel].self, from: decodedData) else {
                    return
                }
        self.items = saveditems
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
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
}
