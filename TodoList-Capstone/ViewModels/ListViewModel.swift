//
//  listViewModel.swift
//  TodoList-Capstone
//
//  Created by Om Prakash Singh on 09/11/24.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var items: [ItemModel] = [] {
        didSet {
            saveItems()
        }
    }

    let itemsKey = "items-list"

    init() {
        getItems()
    }

    func getItems() {
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)

        else {return}
        items.append(contentsOf: savedItems)
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
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }

    func editText(newText: String, item: ItemModel) {
        if let index = items.firstIndex(where: {$0.id == item.id}) {
            items[index] = item.editCompletion(newText: newText)
        }
    }
}
