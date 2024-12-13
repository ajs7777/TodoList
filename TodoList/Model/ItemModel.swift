//
//  ListModel.swift
//  TodoList
//
//  Created by Abhijit Saha on 13/12/24.
//

import Foundation

struct ItemModel: Identifiable, Codable {
    let id : String
    let title: String
    let isCompleted: Bool
  
    init(id: String  = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
  
    func updateCompletion() -> ItemModel {
        return ItemModel(title: title, isCompleted: !isCompleted)
    }
}
