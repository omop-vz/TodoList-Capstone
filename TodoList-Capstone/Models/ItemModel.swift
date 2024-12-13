//
//  ItemModel.swift
//  TodoList-Capstone
//
//  Created by Om Prakash Singh on 08/11/24.
//

import Foundation

struct ItemModel: Identifiable, Codable {
    let id: UUID
    var title: String
    let isCompleted: Bool

    init(id: UUID = UUID(), title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }

    func updateCompletion() -> ItemModel {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }

    func editCompletion(newText: String) -> ItemModel {
        return ItemModel(id: id, title: newText, isCompleted: isCompleted)
    }
}
