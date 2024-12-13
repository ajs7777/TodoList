//
//  AddView.swift
//  TodoList
//
//  Created by Abhijit Saha on 12/12/24.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @EnvironmentObject var listviewModel: ListViewModel
    
    @State var textFieldText: String = ""
    
    var body: some View {
        ScrollView {
            VStack{
                TextField(text: $textFieldText) {
                    Text("Type Something...")
                      
                }
                .padding()
                .frame(height: 60)
                .background(Color.secondary.opacity(0.3))
                .cornerRadius(10)
                
                Button {
                    saveButtonPressed()
                } label: {
                    Text("SAVE")
                        .foregroundColor(Color.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 60)
                        .background(Color.blue)
                        .cornerRadius(10)
                }

                
            }
            .padding()
        }
        .navigationTitle(Text("Add an Item"))
               
    }
    
    func saveButtonPressed() {
        listviewModel.addItem(title: textFieldText)
        dismiss()
    }
}

#Preview {
    NavigationStack {
        AddView()
    }
    .environmentObject(ListViewModel())
}
