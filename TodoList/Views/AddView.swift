//
//  AddView.swift
//  TodoList
//
//  Created by Abhijit Saha on 12/12/24.
//

import SwiftUI

struct AddView: View {
    
    @State var textFieldText: String = ""
    
    var body: some View {
        ScrollView {
            VStack{
                TextField(text: $textFieldText) {
                    Text("  Type Something...")
                      
                }
                .frame(height: 60)
                .background(Color.secondary.opacity(0.3))
                .cornerRadius(10)
                
                Button {
                    
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
}

#Preview {
    NavigationStack {
        AddView()
    }
}
