//
//  ListModel.swift
//  TodoList
//
//  Created by Abhijit Saha on 13/12/24.
//

import Foundation

struct ListModel: Identifiable {
    var id : String = UUID().uuidString
    var title: String
    var isCompleted: Bool
}
