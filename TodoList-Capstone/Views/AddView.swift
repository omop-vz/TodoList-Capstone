//
//  AddView.swift
//  TodoList-Capstone
//
//  Created by Om Prakash Singh on 05/11/24.
//

import SwiftUI

struct AddView: View {
    @State var textFieldText: String = ""
    var body: some View {
        ScrollView{
            VStack{
                TextField("Type something here...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(.lightGray))
                    .cornerRadius(10)
               // Spacer()
                Button(action: {
                    
                }
                        ,
                       label: {
                    Text("Save".uppercased())
                        .foregroundStyle(Color(.white))
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color(.blue))
                        .cornerRadius(10)
                }
                    )
                
            }.padding(14)
        }.navigationTitle("Add an Item ✏️")
    }
}

#Preview {
    NavigationView{
        AddView()
    }
}
