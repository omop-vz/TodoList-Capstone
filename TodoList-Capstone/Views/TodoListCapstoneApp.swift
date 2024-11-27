//
//  Untitled.swift
//  TodoList-Capstone
//
//  Created by Om Prakash Singh on 04/11/24.
//
import SwiftUI
import SwiftData

@main
struct TodoListCapstoneApp: App {

    @StateObject var listViewModel: ListViewModel = ListViewModel()

    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }.navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listViewModel)
        }
    }
}
