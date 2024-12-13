//
//  OnbaordingModel.swift
//  TodoList-Capstone
//
//  Created by Om Prakash Singh on 06/12/24.
//

import Foundation
import DeveloperToolsSupport

struct OnboardingModel: Identifiable {
    let id = UUID()
    let label: String
    let description: String
    let image: ImageResource
}
