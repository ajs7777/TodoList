//
//  ListRowView.swift
//  TodoList
//
//  Created by Abhijit Saha on 12/12/24.
//

import SwiftUI

struct ListRowView: View {
    
    @State var item: ListModel
    
    var body: some View {
        HStack{
            Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "circle")
                .foregroundStyle(item.isCompleted ? Color.green : Color.red)
                .onTapGesture {
                    item.isCompleted.toggle()
                }
            Text(item.title)
            
        }
    }
}

#Preview {
    List{
        let item1 = ListModel(title: "item1", isCompleted: false)
        ListRowView(item: item1)
    }
}
