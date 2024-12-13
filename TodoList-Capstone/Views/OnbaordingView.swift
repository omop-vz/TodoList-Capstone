//
//  OnbaordingView.swift
//  TodoList-Capstone
//
//  Created by Om Prakash Singh on 06/12/24.
//

import SwiftUI

struct OnbaordingView: View {
    @Binding var isOnboardingScreenShowing: Bool
    var body: some View {
        VStack {
            TabView {
                ForEach(OnboardingViewModel.pages) { page in
                    VStack(spacing: 20) {
                        Spacer()
                        Text(page.label)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        Text(page.description)
                            .fontWeight(.medium)
                            .padding(.horizontal, 10)
                        Image(page.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 250, height: 250)
                            .clipShape(.buttonBorder)
                            .background(Color.gray)
                            .padding()
                        Spacer()
                        Spacer()
                    }
                }
            }.tabViewStyle(.page)
            Button {
                isOnboardingScreenShowing.toggle()
            } label: {
                Text("OK")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(Color.blue)
                    .clipShape(.buttonBorder)
                    .padding()
                    .padding()
            }

        }.interactiveDismissDisabled()
            .multilineTextAlignment(.center)
            .onAppear {
                UIPageControl.appearance().currentPageIndicatorTintColor = .label
                UIPageControl.appearance().pageIndicatorTintColor = .systemGray
            }
    }
}

#Preview {
    OnbaordingView(isOnboardingScreenShowing: .constant(true))
}
