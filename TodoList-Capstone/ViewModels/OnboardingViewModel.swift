//
//  OnboardingViewModel.swift
//  TodoList-Capstone
//
//  Created by Om Prakash Singh on 06/12/24.
//

import Foundation

struct OnboardingViewModel: Identifiable {
    let id = UUID()
    static let pages: [OnboardingModel] = [
        OnboardingModel(label: "Welcome to Our App!",
                        description: "Want to Stay Organised ? Click on the Add Button to Add Tasks.",
                        image: .image1),
        OnboardingModel(label: "Write and Save Tasks Easily!",
                        description: "Type out the Task and Click on the Save Button.",
                        image: .image2),
        OnboardingModel(label: "Mark Tasks as Completed",
                        description: "Completed a Task? Click on the task to Change the Checkmark from Red to Green.",
                        image: .image3),
        OnboardingModel(label: "Edit Text of Tasks Easily!", description: "Swipe Right to Edit the Task's Text",
                        image: .image6),
        OnboardingModel(label: "Delete Tasks Easily!", description: "Swipe Left to Remove a Task from the List.",
                        image: .image4),
        OnboardingModel(label: "Change Order of Tasks and More!",
                        description:
                        "Click on Edit on Top Left to Change the Order of Tasks and Top Right to Add more Tasks.",
                        image: .image5)
    ]
}
