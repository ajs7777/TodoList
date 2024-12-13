//
//  ListModel.swift
//  TodoList
//
//  Created by Abhijit Saha on 13/12/24.
//

import Foundation

struct ItemModel: Identifiable {
    let id : String = UUID().uuidString
    let title: String
    let isCompleted: Bool
}
