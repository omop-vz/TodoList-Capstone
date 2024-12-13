//
//  QuoteViewModel.swift
//  TodoList-Capstone
//
//  Created by Om Prakash Singh on 10/12/24.
//

import Foundation
struct QuoteViewModel {
    static func getQuotes() async throws -> QuoteModel {
        // valid URL ?
        let endpoint = "https://qapi.vercel.app/api/random"
        guard let url = URL(string: endpoint)
        else { throw ErrorModel.invalidUrl}
        // Fetching Data
        guard let (data, response) = try? await URLSession.shared.data(from: url)
        else { throw ErrorModel.networkError}
        // verifying response code
        guard let response = response as? HTTPURLResponse, response.statusCode == 200
        else {throw ErrorModel.invalidResponse}
        // decoding the response
        do {
            return try JSONDecoder().decode(QuoteModel.self, from: data)
        } catch {
            throw ErrorModel.invalidData
        }
    }
}
