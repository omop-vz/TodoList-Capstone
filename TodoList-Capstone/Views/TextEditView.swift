//
//  TextEditView.swift
//  TodoList-Capstone
//
//  Created by Om Prakash Singh on 14/12/24.
//

import SwiftUI

struct TextEditView: View {
    @Binding var currentItem: ItemModel
    @EnvironmentObject var listViewModel: ListViewModel
    @Environment(\.dismiss) var dismiss
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
                    Text("Edit Text".uppercased())
                        .foregroundStyle(Color(.white))
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color(.blue))
                        .cornerRadius(10)
                }
                    )
            }.onAppear {
                textFieldText = currentItem.title
            }
            .padding(14)
        }.navigationTitle("Edit Task Name ✏️")
            .alert("Invalid Input", isPresented: $showAlert) {
                Button("Okay!😯", role: .cancel) {

                }
            } message: {
                Text("Input must be 3 characters long!😥😓")
            }

    }

    func saveButtonPressed() {
        if textIsAppropriate() {
            listViewModel.editText(newText: textFieldText, item: currentItem)
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
    NavigationStack {
        TextEditView(currentItem: .constant(ItemModel(title: "RandomTask", isCompleted: true)))
            }.environmentObject(ListViewModel() )
}
