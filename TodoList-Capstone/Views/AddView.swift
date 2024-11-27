//
//  AddView.swift
//  TodoList-Capstone
//
//  Created by Om Prakash Singh on 05/11/24.
//

import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    @State var showAlert = false

    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something here...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(10)
               // Spacer()
                Button(action: saveButtonPressed
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
            .alert("Invalid Input", isPresented: $showAlert) {
                Button("Okay!😯", role: .cancel) {

                }
            } message: {
                Text("Input must be 3 characters long!😥😓")
            }

    }

    func saveButtonPressed() {
        if textIsAppropriate() {
            listViewModel.addItem(title: textFieldText)
            dismiss()
        }
    }

    func textIsAppropriate() -> Bool {
        if textFieldText.count < 3 {
            showAlert.toggle()
            return false
        }
        return true
    }
}

#Preview {
    NavigationView {
        AddView()
    }.environmentObject(ListViewModel())
}
