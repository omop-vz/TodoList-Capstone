//
//  ListRowView.swift
//  TodoList-Capstone
//
//  Created by Om Prakash Singh on 04/11/24.
//

import SwiftUI

struct ListRowView: View {
    var title: String
    var body: some View {
        HStack{
            Image(systemName: "checkmark.circle")
            Text(title)
            Spacer()
        }
    }
}


#Preview {
    NavigationView{
        ListRowView(title: "demo")
    }
}
