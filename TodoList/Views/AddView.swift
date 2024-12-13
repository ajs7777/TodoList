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
    @State var showAlert: Bool = false
    @State var alertTitle: String = ""
    
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
        .alert(isPresented: $showAlert) {
            getAlert()
        }
        
    }
    
    func saveButtonPressed() {
        if textIsAppropiate() {
            listviewModel.addItem(title: textFieldText)
            dismiss()
        }
        
    }
    
    func textIsAppropiate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Title must be at least 3 characters long"
            showAlert.toggle()
            return false
        }
        return true
    }
    func getAlert() -> Alert {
        Alert(title: Text(alertTitle), message: Text("enter 6 characers"), dismissButton: .default(Text("OK")))
    }
}

#Preview {
    NavigationStack {
        AddView()
    }
    .environmentObject(ListViewModel())
}
