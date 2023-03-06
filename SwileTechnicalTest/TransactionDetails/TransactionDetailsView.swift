//
//  TransactionDetailsView$.swift
//  SwileTechnicalTest
//
//  Created by Julien Forestier on 25/02/2023.
//

import SwiftUI
import ComposableArchitecture

struct TransactionDetailsView: View {

  let store: StoreOf<TransactionsStore>
  let transaction: Transaction
  let animationNamespace: Namespace.ID

  @State var showCloseButton: Bool = false
  @State var showDetails: Bool = false
  @State var showActions: Bool = false

    var body: some View {
      GeometryReader { reader in
        VStack(spacing: 0) {

          TransactionDetailsTopView(store: store, transaction: transaction, animationNamespace: animationNamespace, showCloseButton: $showCloseButton, showDetails: $showDetails, showActions: $showActions)
            .frame(height: 224)

          Group {
            Group {
              if transaction.amount.positive() {
                positiveAmountLabel
              } else {
                negativeAmountLabel
              }
            }
            .padding(.top, 24)

            Text(transaction.name)
              .graphikFont(.regular, size: 13)
              .foregroundColor(Color.colorAssets(.blue_color))
              .frame(minHeight: 18)
              .padding(.top, 4)

            Text(transaction.date, formatter: DateFormatter.LongDateFormatter())
              .graphikFont(.regular, size: 13)
              .foregroundColor(Color.colorAssets(.gray_color))
              .frame(minHeight: 18)
              .padding(.top, 4)
          }
          .offset(y: showDetails ? 0 : 20)
          .opacity(showDetails ? 1 : 0)

          VStack(spacing: 0) {
            TransactionDetailsCategoryCellView(transaction: transaction)
            divider
            TransactionDetailsActionCellView(icon: .share, labelString: Constants.TransactionsDetails.share)
            divider
            TransactionDetailsActionCellView(icon: .heart, labelString: Constants.TransactionsDetails.like)
            divider
            TransactionDetailsActionCellView(icon: .help, labelString: Constants.TransactionsDetails.report)
            Spacer()
          }
          .padding(.horizontal, 20)
          .padding(.top, 24)
          .offset(y: showActions ? 0 : 20)
          .opacity(showActions ? 1 : 0)

          Spacer()
        }
        .background(.white)
        .frame(width: reader.size.width, height: reader.size.height)
      }
      .ignoresSafeArea()
      .onAppear {
        withAnimation(Animation.default.delay(0.5)) {
          showDetails.toggle()
          showCloseButton.toggle()
        }
        withAnimation(Animation.default.delay(1)) {
          showActions.toggle()
        }
      }
    }

  var negativeAmountLabel: some View {
    Text(transaction.amount.formattedValue())
      .foregroundColor(Color.colorAssets(.blue_color))
      .graphikFont(.medium, size: 34)
  }

  var positiveAmountLabel: some View {
    ZStack(alignment: .top) {
      Text(transaction.amount.formattedValue())
        .foregroundColor(Color.colorAssets(.transaction_positive_amount_color))
        .frame(height: 41)
        .padding(.horizontal, 6)
        .background(Color.colorAssets(.transaction_positive_amount_background_color))
        .cornerRadius(9)
        .graphikFont(.medium, size: 34)
    }
  }

  var divider: some View {
    Divider()
      .padding(.leading, 44)
  }

}

struct TransactionDetailsView_Previews: PreviewProvider {

    @Namespace static var namespace

    static var previews: some View {
      TransactionDetailsView(store: Store(
        initialState: TransactionsStore.State(),
        reducer: TransactionsStore()._printChanges()
      ), transaction: Transaction.mock, animationNamespace: namespace)
    }
}
