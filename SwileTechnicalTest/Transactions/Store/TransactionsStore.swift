//
//  TransactionsReducerProtocol.swift
//  SwileTechnicalTest
//
//  Created by Julien Forestier on 23/02/2023.
//

import ComposableArchitecture

struct TransactionsStore: ReducerProtocol {

  struct State: Equatable {
    var currentPage: Int = 1
    var transactions: Transactions = Transactions(results: [])
    var selectedTransaction: Transaction?
    var alert: AlertState<Action>?
    var isLoading: Bool = false
  }

  enum Action: Equatable {
    case selectTransaction(Transaction)
    case deselectTransition
    case loadTransactions
    case loadTransactionsResponse(TaskResult<Transactions>)
    case loadMoreTransactionsIfNeeded(id: String)
    case loadMoreTransactionsIfNeededResponse(TaskResult<Transactions>)
    case alertDismissed
  }

  @Dependency(\.transactionsClient) var transactionsClient

  private enum CancelID {}

  func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
    switch action {
      case let .selectTransaction(value):
        state.selectedTransaction = value
        return .none
      case .deselectTransition:
        state.selectedTransaction = nil
        return .none
      case .loadTransactions:
        state.isLoading = true
        state.currentPage = 1
        return .task { [currentPage = state.currentPage] in
          await .loadTransactionsResponse(TaskResult { try await transactionsClient.loadTransactions(currentPage) })
        }
        .cancellable(id: CancelID.self)
      case let .loadTransactionsResponse(.failure(error)):
        state.isLoading = false
        state.alert = AlertState { TextState(error.localizedDescription) }
        state.transactions = Transactions(results: [])
        return .none
      case let .loadTransactionsResponse(.success(response)):
        state.isLoading = false
        state.transactions = response
        return .none

      case let .loadMoreTransactionsIfNeeded(id):
        guard state.transactions.isLastItem(id) else {
          return .none
        }
        state.isLoading = true
        state.currentPage += 1
        return .task { [currentPage = state.currentPage] in
          await .loadMoreTransactionsIfNeededResponse(TaskResult { try await transactionsClient.loadTransactions(currentPage) })
        }
        .cancellable(id: CancelID.self)
      case let .loadMoreTransactionsIfNeededResponse(.success(response)):
        state.isLoading = false
        state.transactions.results.append(contentsOf: response.results)
        return .none
      case let .loadMoreTransactionsIfNeededResponse(.failure(error)):
        state.isLoading = false
        state.currentPage -= 1
        state.alert = AlertState { TextState(error.localizedDescription) }
        return .none
      case .alertDismissed:
        state.alert = nil
        return .none
    }
  }
}
