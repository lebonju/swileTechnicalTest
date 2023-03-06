//
//  TransactionDetailsBadgeIcon.swift
//  SwileTechnicalTest
//
//  Created by Julien Forestier on 04/03/2023.
//

import SwiftUI

struct BadgeIconView: View {

  var image: Image
  var imageSize: CGSize
  var backgroundSize: CGSize

    var body: some View {
      ZStack {
        Circle()
          .fill(.white)
          .frame(width: backgroundSize.width, height: backgroundSize.height)
        image
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: imageSize.width, height: imageSize.height)
          .cornerRadius(9)
      }
    }
}

struct BadgeIconView_Previews: PreviewProvider {
    static var previews: some View {
      BadgeIconView(image: Image.imageAssets(fromImageAssets: .meal_voucher), imageSize: CGSize(width: 18, height: 18), backgroundSize: CGSize(width: 30, height: 30))
    }
}
