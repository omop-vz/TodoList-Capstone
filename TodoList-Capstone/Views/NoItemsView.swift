//
//  NoItemsView.swift
//  TodoList-Capstone
//
//  Created by Om Prakash Singh on 12/11/24.
//

import SwiftUI

struct NoItemsView: View {
    @State var animate = false
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Text("There are no Items!")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Wanna Stay Organised? Click on the Add button to add tasks!")
                    .padding(.bottom, 20)
                NavigationLink(destination: AddView()) {
                    Text("Add Something ✍️")
                        .foregroundStyle(Color(.white))
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color(animate ? .red : .blue))
                        .clipShape(.buttonBorder)
                }
                .padding(.horizontal, animate ? 30 : 50)
                .shadow(color: animate ? .red.opacity(0.7) : .blue.opacity(0.7), radius: 10,
                        x: 0, y: animate ? 50 : 30)
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -7 : 0)

            }.multilineTextAlignment(.center)
                .padding(40)
                .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: 400, maxHeight: .infinity)
    }
    func addAnimation() {
        guard !animate else {return}
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(.easeInOut(duration: 2.0).repeatForever()) {
                animate.toggle()
            }
        }
    }
}

#Preview {
    NavigationView {
        NoItemsView().navigationTitle("Title")
    }
}
