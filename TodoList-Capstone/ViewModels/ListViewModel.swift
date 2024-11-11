//
//  listViewModel.swift
//  TodoList-Capstone
//
//  Created by Om Prakash Singh on 09/11/24.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var items: [ItemModel] = []

    func getItems() {
        let newItems = [ItemModel(title: "First title", isCompleted: true),
                        ItemModel(title: "Second title", isCompleted: false)]
        items.append(contentsOf: newItems)
    }

    init() {
        getItems()
    }

    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    func moveItem(from: IndexSet, moveTo: Int) {
        items.move(fromOffsets: from, toOffset: moveTo)
    }
    func addItem(title: String) {
        let item = ItemModel(title: title, isCompleted: false)
        items.append(item)
    }
    func updateItem(item: ItemModel) {
        if let index = items.firstIndex(where: {$0.id == item.id}) {
            items[index] = item.updateCompletion()
        }
    }
}
