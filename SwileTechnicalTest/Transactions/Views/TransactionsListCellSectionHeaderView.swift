//
//  SectionHeaderView.swift
//  SwileTechnicalTest
//
//  Created by Julien Forestier on 01/03/2023.
//

import SwiftUI

struct TransactionsListCellSectionHeaderView: View {
  var value: String

  var body: some View {
    Text(value)
      .graphikFont(.medium, size: 13)
      .frame(height: 24)
      .listRowInsets(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
  }
}

struct TransactionsListCellSectionHeaderView_Previews: PreviewProvider {
    static var previews: some View {
      TransactionsListCellSectionHeaderView(value: "HeaderPreview")
    }
}
