//
//  ContentView.swift
//  TodoList
//
//  Created by Abhijit Saha on 12/12/24.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel : ListViewModel
    
    var body: some View {
        List {
            ForEach(listViewModel.items) { item in
                ListRowView(item: item)
                    .onTapGesture {
                        withAnimation {
                            listViewModel.updateItem(item: item)
                        }
                    }
            }
            .onDelete(perform: listViewModel.deleteItems)
            .onMove(perform: listViewModel.moveItems)
            
        }
        .listStyle(PlainListStyle())
        .navigationTitle(Text("Todo List"))
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink(destination: AddView()) {
                    Image(systemName: "plus")
                }
            }
            ToolbarItem(placement: .navigationBarLeading) {
                EditButton()
            }
        }
    }
}

#Preview {
    NavigationStack {
        ListView()
    }
    .environmentObject(ListViewModel())
}

