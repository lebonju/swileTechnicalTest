//
//  ApiTransactionsREpository.swift
//  SwileTechnicalTest
//
//  Created by Julien Forestier on 23/02/2023.
//

import Foundation
import ComposableArchitecture
import Alamofire

extension TransactionsRepository: DependencyKey {

  static let liveValue = TransactionsRepository(
    getTransactions: {
      let response = await AF.request(Constants.API.transactions).validate().serializingData().response

      switch response.result {
        case let .failure(error):
          throw error
        case let .success(data):
          var transactions = try JSONDecoder.withIsoDateStrategy().decode(Transactions.self, from: data)
          return transactions
      }
    }
  )
}
