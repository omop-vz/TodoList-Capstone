//
//  ListRowView.swift
//  TodoList-Capstone
//
//  Created by Om Prakash Singh on 04/11/24.
//

import SwiftUI

struct ListRowView: View {
    var item: ItemModel
    var body: some View {
        HStack {
            Text("")
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundStyle(Color(item.isCompleted ? .green : .red))
            Text(item.title)
            Spacer()
        } .font(.title2)
        .padding(.vertical, 8)
    }
}

#Preview {
    NavigationStack {
        ListRowView(item: ItemModel(title: "First title", isCompleted: true))
    }
}
