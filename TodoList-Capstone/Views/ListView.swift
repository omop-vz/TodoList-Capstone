//
//  ListView.swift
//  TodoList-Capstone
//
//  Created by Om Prakash Singh on 04/11/24.
//

import SwiftUI

struct ListView: View {
    @State var items: [String] = ["First title","Second Title","third title"]
    
    var body: some View {
        List{
            ForEach(items, id: \.self) { item in
                ListRowView(title: item)
            }
        }.navigationTitle("To-Do List 📝")
            .toolbar{
                ToolbarItem(placement: .topBarLeading){
                    EditButton()
                }
                ToolbarItem(placement: .topBarTrailing){
                    NavigationLink("Add", destination: AddView())
                }
            }
    }
}

#Preview {
    NavigationView{
        ListView()
    }
}

