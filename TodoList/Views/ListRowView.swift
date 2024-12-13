//
//  ListRowView.swift
//  TodoList
//
//  Created by Abhijit Saha on 12/12/24.
//

import SwiftUI

struct ListRowView: View {
    
    @State var item: ItemModel
    
    var body: some View {
        HStack{
            Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "circle")
                .foregroundStyle(item.isCompleted ? Color.green : Color.red)
                
            Text(item.title)
                
            
        }
    }
}

#Preview {
    List{
        let item1 = ItemModel(title: "item1", isCompleted: false)
        ListRowView(item: item1)
    }
}
