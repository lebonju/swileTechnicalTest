//
//  TransactionListCellAmountView.swift
//  SwileTechnicalTest
//
//  Created by Julien Forestier on 24/02/2023.
//

import SwiftUI

struct TransactionsListCellAmountView: View {

  var amount: Amount

    var body: some View {
      Group {
        if amount.positive() {
          positiveAmountLabel
        } else {
          negativeAmountLabel
        }
      }
    }

  var negativeAmountLabel: some View {
    Text(amount.formattedValue())
      .foregroundColor(Color.colorAssets(.blue_color))
      .graphikFont(.medium, size: 15)
  }

  var positiveAmountLabel: some View {
    Text(amount.formattedValue())
      .foregroundColor(Color.colorAssets(.transaction_positive_amount_color))
      .frame(minHeight: 20)
      .padding(.horizontal, 6)
      .background(Color.colorAssets(.transaction_positive_amount_background_color))
      .cornerRadius(9)
      .graphikFont(.medium, size: 15)
  }

}

struct TransactionListCellAmountView_Previews: PreviewProvider {
    static var previews: some View {
      TransactionsListCellAmountView(amount: Transaction.mock.amount)
    }
}
