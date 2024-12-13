//
//  ListView.swift
//  TodoList-Capstone
//
//  Created by Om Prakash Singh on 04/11/24.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var listViewModel: ListViewModel
    @AppStorage("isOnboardingScreenShowing") var isOnboardingScrenShowing = true
    @State var isTextEditorShowing = false
    @State var currentItem: ItemModel
    var body: some View {
        ZStack {
            if listViewModel.items.isEmpty {
                NoItemsView().transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                List {
                    ForEach(listViewModel.items) { item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    listViewModel.updateItem(item: item)
                                }
                            }
                            .swipeActions(edge: .leading) {
                                Button {
                                    currentItem = item
                                    isTextEditorShowing.toggle()
                                } label: {
                                    Label("EditText", systemImage: "highlighter")
                                }

                            }
                    }.onDelete(perform: listViewModel.deleteItem)
                        .onMove(perform: listViewModel.moveItem)
                }.listStyle(.automatic)
            }
        }
        .navigationTitle("To-Do List 📝")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                        .opacity(listViewModel.items.isEmpty ? 0 : 1)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink("Add Items", destination: AddView())
                        .opacity(listViewModel.items.isEmpty ? 0 : 1)
                }
            }
            .fullScreenCover(isPresented: $isOnboardingScrenShowing) {
                OnbaordingView(isOnboardingScreenShowing: $isOnboardingScrenShowing)
            }.fullScreenCover(isPresented: $isTextEditorShowing) {
                TextEditView(currentItem: $currentItem)
            }
    }
}

#Preview {
    NavigationStack {
        ListView(currentItem: ItemModel(title: "RandomTask", isCompleted: true))
    }.environmentObject(ListViewModel())
}
