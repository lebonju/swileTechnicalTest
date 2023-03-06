//
//  TransactionDetailsViewButton.swift
//  SwileTechnicalTest
//
//  Created by Julien Forestier on 26/02/2023.
//

import SwiftUI

struct TransactionDetailsCategoryCellView: View {

  let transaction: Transaction
  let iconBackgroundSize: CGFloat = 32.0
  let iconBackgroundSizeBorder: CGFloat = 30.0
  let iconSize: CGFloat = 20

    var body: some View {
      HStack(spacing: 0) {

        ZStack {
          if transaction.smallIcon.hasUrl() {
            imageBackground
          } else {
            coloredBackground
            icon
          }
        }
        .frame(width: iconBackgroundSize, height: iconBackgroundSize)

        VStack {
          Spacer()
          Text(LocalizedStringKey(transaction.smallIcon.category))
            .graphikFont(.medium, size: 15)
            .foregroundColor(Color.colorAssets(.blue_color))
            .frame(maxWidth: .infinity, idealHeight: 20, alignment: .leading)
            .padding(.leading, 12)
          Spacer()
        }
        Spacer()

        VStack {
          Spacer()
          Text(LocalizedStringKey(Constants.TransactionsDetails.switchAccount))
            .graphikFont(.medium, size: 15)
            .foregroundColor(Color.colorAssets(.transaction_positive_amount_color))
            .frame(width: 100)
            .multilineTextAlignment(.trailing)
          Spacer()
        }

      }
      .frame(height: 56)
    }

  private var coloredBackground: some View {
    ZStack {
      Rectangle()
        .fill(Color.colorFromAssetsName(transaction.smallIcon.category))
        .frame(width: iconBackgroundSize, height: iconBackgroundSize)
        .thumbnailMask(width: iconBackgroundSize, height: iconBackgroundSize)
      Rectangle()
        .fill(Color.borderColorFromAssetsName(transaction.smallIcon.category))
        .frame(width: iconBackgroundSizeBorder, height: iconBackgroundSizeBorder)
        .thumbnailBorderMask(width: iconBackgroundSizeBorder, height: iconBackgroundSizeBorder)
    }
  }

  private var icon: some View {
    Image.imageAssets(fromString: transaction.smallIcon.category)
      .resizable()
      .frame(width: iconSize, height: iconSize)
  }

  private var imageBackground: some View {
    ZStack {
      AsyncImage(
        url: URL(string: transaction.smallIcon.url ?? ""),
        content: { image in
          image
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: iconBackgroundSize, height: iconBackgroundSize)
            .thumbnailMask(width: iconBackgroundSize, height: iconBackgroundSize)
        }, placeholder: { }
      )

      Rectangle()
        .fill(Color.colorAssets(.image_border_color))
        .frame(width: iconBackgroundSizeBorder, height: iconBackgroundSizeBorder)
        .thumbnailBorderMask(width: iconBackgroundSizeBorder, height: iconBackgroundSizeBorder)
    }
  }
}

struct TransactionDetailsViewCategoryCell_Previews: PreviewProvider {
    static var previews: some View {
      TransactionDetailsCategoryCellView(transaction: Transaction.mock)
    }
}
