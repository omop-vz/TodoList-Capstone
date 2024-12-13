//
//  QuoteView.swift
//  TodoList-Capstone
//
//  Created by Om Prakash Singh on 10/12/24.
//

import SwiftUI

struct QuoteView: View {
    @State var quoteResponse: QuoteModel?
    var body: some View {
        VStack {
            Text("\"\(quoteResponse?.quote ?? "Yesterday you said tomorrow")\"")
                .italic()
                .fontWeight(.semibold)
                .padding()
            Text(quoteResponse?.author ?? "Anonymous")
                .font(.subheadline)
                .fontWeight(.medium)
        }.multilineTextAlignment(.center)
            .task {
                do {
                    quoteResponse = try await QuoteViewModel.getQuotes()
                } catch ErrorModel.invalidData {
                    print("Invalid Data!")
                } catch ErrorModel.invalidResponse {
                    print("Invalid Response!")
                } catch ErrorModel.invalidUrl {
                    print("Invalid URL!")
                } catch ErrorModel.networkError {
                    print("Network Error!")
                } catch {
                    print("Unexpected Error")
                }
            }
    }
}

#Preview {
    QuoteView()
}
