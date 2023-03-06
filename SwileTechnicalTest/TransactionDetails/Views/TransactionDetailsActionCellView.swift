//
//  TransactionDetailsViewActionCell.swift
//  SwileTechnicalTest
//
//  Created by Julien Forestier on 26/02/2023.
//

import SwiftUI

struct TransactionDetailsActionCellView: View {

  let icon: ImageAssets
  let labelString: String

  let iconBackgroundSize: CGFloat = 32.0
  let iconBackgroundSizeBorder: CGFloat = 30.0
  let iconSize: CGFloat = 20

    var body: some View {

      HStack(spacing: 0) {
        ZStack {
          Rectangle()
            .fill(Color.colorAssets(ColorAssets.transaction_detail_action_color))
            .frame(width: iconBackgroundSize, height: iconBackgroundSize)
            .thumbnailMask(width: iconBackgroundSize, height: iconBackgroundSize)
          Rectangle()
            .fill(Color.colorAssets(ColorAssets.transaction_detail_action_border_color))
            .frame(width: iconBackgroundSizeBorder, height: iconBackgroundSizeBorder)
            .thumbnailBorderMask(width: iconBackgroundSizeBorder, height: iconBackgroundSizeBorder)

          Image.imageAssets(fromImageAssets: icon)
            .resizable()
            .frame(width: iconSize, height: iconSize)
        }
        .frame(width: iconBackgroundSize, height: iconBackgroundSize)

        VStack {
          Spacer()
          Text(LocalizedStringKey(labelString))
            .graphikFont(.medium, size: 15)
            .foregroundColor(Color.colorAssets(.blue_color))
            .frame(maxWidth: .infinity, idealHeight: 20, alignment: .leading)
            .padding(.leading, 12)
          Spacer()
        }
      }
      .frame(height: 56)
    }
}

struct TransactionDetailsViewActionCell_Previews: PreviewProvider {
    static var previews: some View {
      TransactionDetailsActionCellView(icon: .share, labelString: "Partage d'addition")
    }
}
