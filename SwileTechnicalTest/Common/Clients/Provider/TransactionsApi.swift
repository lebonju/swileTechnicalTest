//
//  TransactionsApi.swift
//  SwileTechnicalTest
//
//  Created by Julien Forestier on 04/03/2023.
//

import Alamofire
import ComposableArchitecture
import Foundation

struct TransactionsApi {

  func getTransactions() async throws -> Transactions {
    let response = await AF.request(Constants.API.transactions).validate().serializingData().response

    switch response.result {
      case let .failure(error):
        throw error
      case let .success(data):
        let transactions = try JSONDecoder.withIsoDateStrategy().decode(Transactions.self, from: data)
        return transactions
    }
  }

  func getTransactions(page: Int) async throws -> Transactions {

    var transactions = try await getTransactions()
    if page == 1 {
      return transactions
    }

    for index in 0..<transactions.results.count {
      if let newDate = transactions.results[index].date.addYear(value: -page) {
        transactions.results[index].date = newDate
      }
    }
    return transactions
  }

}
