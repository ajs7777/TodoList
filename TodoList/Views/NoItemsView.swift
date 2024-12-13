//
//  NoItemsView.swift
//  TodoList
//
//  Created by Abhijit Saha on 13/12/24.
//

import SwiftUI

struct NoItemsView: View {
    
    @State var animate : Bool = false
    
    var body: some View {
        ScrollView {
            VStack{
                Text("No items")
                    .font(.title)
                Text("Add items to your list")
                
                NavigationLink(destination: AddView()) {
                    Text("Add New Item")
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .frame(width: 200, height: 50)
                        .background(Color.blue)
                        .cornerRadius(10)
                        
                }
                .scaleEffect(animate ? 1.1 : 1.0)
                
            }
            .padding(40)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        //.navigationTitle(Text("No Items"))
    }
    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}

#Preview {
    //NavigationStack {
        NoItemsView()
   // }
}
