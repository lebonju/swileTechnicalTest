//
//  Transactions.swift
//  SwileTechnicalTest
//
//  Created by Julien Forestier on 22/02/2023.
//

import SwiftUI
import ComposableArchitecture

struct TransactionsView: View {

  let store: StoreOf<TransactionsStore>
  @Namespace var animationNamespace

  init(store: StoreOf<TransactionsStore>) {
    self.store = store
    UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(Color.colorAssets(.blue_color))]
  }

    var body: some View {
      WithViewStore(self.store) { viewStore in

        ZStack {
          NavigationView {
            List(viewStore.state.transactions.transactionSections(), id: \.name) { section in
              Section(header: TransactionsListCellSectionHeaderView(value: section.name).textCase(.none)) {
                ForEach(section.transactions) { transaction in
                  TransactionsListCellView(transaction: transaction, animationNamespace: animationNamespace)
                    .listRowInsets(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                    .listRowSeparator(.hidden)
                    .onTapGesture {
                      viewStore.send(.selectTransaction(transaction), animation: .linear(duration: 0.4))
                    }
                    .onAppear {
                      viewStore.send(.loadMoreTransactionsIfNeeded(id: transaction.id))
                    }
                }
              }
            }
            .listStyle(.grouped)
            .navigationTitle(LocalizedStringKey(Constants.Transactions.title))
            .navigationBarTitleDisplayMode(.large)
            .scrollContentBackground(.hidden)
            .refreshable {
              viewStore.send(.loadTransactions)
            }
          }
          .alert(self.store.scope(state: \.alert), dismiss: .alertDismissed)
          .opacity(viewStore.selectedTransaction != nil ? 0 : 1)

          if viewStore.isLoading {
            ProgressView()
          }

          if viewStore.selectedTransaction != nil {
            TransactionDetailsView(store: store, transaction: viewStore.selectedTransaction!, animationNamespace: animationNamespace)
          }
        }
        .onAppear {
          viewStore.send(.loadTransactions)
        }
      }
    }
}

struct TransactionsView_Previews: PreviewProvider {
    static var previews: some View {
      TransactionsView(store: Store(
        initialState: TransactionsStore.State(),
        reducer: TransactionsStore()
      ))
    }
}
