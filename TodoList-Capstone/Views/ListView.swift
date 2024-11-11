//
//  ListView.swift
//  TodoList-Capstone
//
//  Created by Om Prakash Singh on 04/11/24.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var listViewModel: ListViewModel

    var body: some View {
        List {
            ForEach(listViewModel.items) { item in
                ListRowView(item: item)
                    .onTapGesture {
                        withAnimation(.linear) {
                            listViewModel.updateItem(item: item)
                        }
                    }
            }.onDelete(perform: listViewModel.deleteItem)
                .onMove(perform: listViewModel.moveItem)
        }.listStyle(.automatic)
        .navigationTitle("To-Do List 📝")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink("Add Items", destination: AddView())
                }
            }
    }
}

#Preview {
    NavigationView {
        ListView()
    }.environmentObject(ListViewModel())
}
