//
//  TransactionListView.swift
//  SwileTechnicalTest
//
//  Created by Julien Forestier on 24/02/2023.
//

import SwiftUI

struct TransactionsListCellView: View {

  @State var transaction: Transaction
  var animationNamespace: Namespace.ID

    var body: some View {
      HStack {
        TransactionsListCellLeftImageView(transaction: $transaction, animationNamespace: animationNamespace)
        VStack {
          Text(transaction.name)
            .graphikFont(.medium, size: 15)
            .foregroundColor(Color.colorAssets(.blue_color))
            .frame(maxWidth: .infinity, idealHeight: 20, alignment: .leading)

          Text(transaction.date, formatter: DateFormatter.ShortDateFormatter())
            .graphikFont(.medium, size: 12)
            .foregroundColor(Color.colorAssets(.gray_color))
            .frame(maxWidth: .infinity, idealHeight: 16, alignment: .leading)
        }
        Spacer()
        TransactionsListCellAmountView(amount: transaction.amount
        )
      }
      .frame(maxWidth: .infinity, idealHeight: 72)
      .background(.white)
    }
}

struct TransactionsListElement_Previews: PreviewProvider {
    @Namespace static var namespace

    static var previews: some View {
      TransactionsListCellView(transaction: .mock, animationNamespace: namespace)
    }
}
