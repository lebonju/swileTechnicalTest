//
//  SwileTechnicalTestTests.swift
//  SwileTechnicalTestTests
//
//  Created by Julien Forestier on 03/03/2023.
//

import XCTest
import ComposableArchitecture
import Alamofire
@testable import SwileTechnicalTest

@MainActor
final class SwileTechnicalTestTests: XCTestCase {

    func testTransactions() async {

      let store = TestStore(
        initialState: TransactionsStore.State(),
        reducer: TransactionsStore()
      )

      await store.send(.loadTransactions) {
        $0.isLoading = true
      }

      await store.receive(.loadTransactionsResponse(.success(.mock))) {
        $0.transactions = Transactions.mock
        $0.isLoading = false
      }

      await store.send(.selectTransaction(Transaction.mock)) {
        $0.selectedTransaction = Transaction.mock
      }

      await store.send(.deselectTransition) {
        $0.selectedTransaction = nil
      }
    }

    func testTransactionsFailure() async {

      let store = TestStore(
        initialState: TransactionsStore.State(),
        reducer: TransactionsStore()
      ) {
        $0.transactionsClient.loadTransactions = { _ in throw SomethingWentWrong() }
      }

      await store.send(.loadTransactions) {
        $0.isLoading = true
      }

      await store.receive(.loadTransactionsResponse(.failure(SomethingWentWrong()))) {
        $0.alert = AlertState { TextState(SomethingWentWrong().localizedDescription) }
        $0.isLoading = false
      }
    }

}

private struct SomethingWentWrong: Equatable, Error {
  var errorDescription: String? {
    return "Something went wrong"
  }
}
