//
//  LeftImageView.swift
//  SwileTechnicalTest
//
//  Created by Julien Forestier on 24/02/2023.
//

import SwiftUI
import CachedAsyncImage

struct TransactionsListCellLeftImageView: View {

  let iconBackgroundSize: CGFloat = 56.0
  let iconBackgroundSizeBorder: CGFloat = 54.0
  let iconSize: CGFloat = 22

  @Binding var transaction: Transaction
  let animationNamespace: Namespace.ID

  var body: some View {
    ZStack {
      if transaction.largeIcon.hasUrl() {
        imageBackground
      } else {
        coloredBackground
        icon
      }
    }
    .frame(width: iconBackgroundSize, height: iconBackgroundSize)
    .overlay(alignment: .bottomTrailing) {
      if transaction.smallIcon.hasUrl() {
        badgeImage
      } else {
        BadgeIconView(image: Image.imageAssets(fromString: transaction.smallIcon.category), imageSize: CGSize(width: 11, height: 11), backgroundSize: CGSize(width: 19, height: 19))
          .matchedGeometryEffect(id: "\(transaction.id)\(Constants.Animations.badgeSuffix)", in: animationNamespace)
          .offset(x: 2)
      }
    }
  }

  private var coloredBackground: some View {
    ZStack {
      Rectangle()
        .fill(Color.colorFromAssetsName(transaction.smallIcon.category))
        .matchedGeometryEffect(id: "\(transaction.id)\(Constants.Animations.rectangleSuffix)", in: animationNamespace)
        .frame(width: iconBackgroundSize, height: iconBackgroundSize)
        .thumbnailMask(width: iconBackgroundSize, height: iconBackgroundSize)
      Rectangle()
        .fill(Color.borderColorFromAssetsName(transaction.smallIcon.category))
        .frame(width: iconBackgroundSizeBorder, height: iconBackgroundSizeBorder)
        .thumbnailBorderMask(width: iconBackgroundSizeBorder, height: iconBackgroundSizeBorder)
    }
  }

  private var icon: some View {
    Image.imageAssets(fromString: transaction.largeIcon.category)
      .resizable()
      .matchedGeometryEffect(id: "\(transaction.id)\(Constants.Animations.iconSuffix)", in: animationNamespace)
      .frame(width: iconSize, height: iconSize)
  }

  private var imageBackground: some View {
    ZStack {
      Rectangle()
        .fill(Color.colorAssets(.gray_color))
        .matchedGeometryEffect(id: "\(transaction.id)\(Constants.Animations.rectangleSuffix)", in: animationNamespace)
        .frame(width: iconBackgroundSize, height: iconBackgroundSize)
        .opacity(0)

      if let strongUrl = transaction.largeIcon.url {
        CachedAsyncImage(
          url: URL(string: strongUrl),
          content: { image in
            image
              .resizable()
              .aspectRatio(contentMode: .fill)
              .frame(width: iconBackgroundSize, height: iconBackgroundSize)
              .thumbnailMask(width: iconBackgroundSize, height: iconBackgroundSize)
              .matchedGeometryEffect(id: "\(transaction.id)\(Constants.Animations.iconSuffix)", in: animationNamespace)
          }, placeholder: {
            // no placeholder
          }
        )
      }

      Rectangle()
        .fill(Color.colorAssets(.image_border_color))
        .frame(width: iconBackgroundSizeBorder, height: iconBackgroundSizeBorder)
        .thumbnailBorderMask(width: iconBackgroundSizeBorder, height: iconBackgroundSizeBorder)
    }
  }

  private var badgeImage: some View {
    CachedAsyncImage(
      url: URL(string: transaction.smallIcon.url ?? ""),
      content: { image in
        BadgeIconView(image: image, imageSize: CGSize(width: 11, height: 11), backgroundSize: CGSize(width: 19, height: 19))
        .matchedGeometryEffect(id: "\(transaction.id)\(Constants.Animations.badgeSuffix)", in: animationNamespace)
      }, placeholder: {
        // no placeholder
      }
    )
    .offset(x: 2)
  }

}

struct TransactionListCellLeftImageView_Previews: PreviewProvider {
    @Namespace static var namespace

    static var previews: some View {
      TransactionsListCellLeftImageView(transaction: .constant(.mock), animationNamespace: namespace)
    }
}
