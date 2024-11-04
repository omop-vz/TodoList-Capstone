//
//  Untitled.swift
//  TodoList-Capstone
//
//  Created by Om Prakash Singh on 04/11/24.
//
import SwiftUI
import SwiftData

@main
struct TodoList_CapstoneApp: App {
    

    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListView()
            }
        }
        //.modelContainer(sharedModelContainer)
    }
}

