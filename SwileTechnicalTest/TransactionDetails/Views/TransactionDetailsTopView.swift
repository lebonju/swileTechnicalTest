//
//  TransactionDetailsTopView.swift
//  SwileTechnicalTest
//
//  Created by Julien Forestier on 28/02/2023.
//

import SwiftUI
import ComposableArchitecture
import CachedAsyncImage

struct TransactionDetailsTopView: View {

  let store: StoreOf<TransactionsStore>
  let transaction: Transaction
  let animationNamespace: Namespace.ID

  @Binding var showCloseButton: Bool
  @Binding var showDetails: Bool
  @Binding var showActions: Bool

  var iconSize: CGFloat = 72

    var body: some View {

      WithViewStore(self.store) { viewStore in

        ZStack(alignment: .top) {
          Rectangle()
            .fill(transaction.largeIcon.hasUrl() ? Color.colorAssets(.gray_color) : Color.colorFromAssetsName(transaction.type))
            .matchedGeometryEffect(id: "\(transaction.id)\(Constants.Animations.rectangleSuffix)", in: animationNamespace)

          closeButton
            .onTapGesture {
              withAnimation {
                showDetails.toggle()
                showCloseButton.toggle()
                showActions.toggle()
              }
              DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                viewStore.send(.deselectTransition, animation: .linear(duration: 0.4))
              }
            }

          if let strongUrl = transaction.largeIcon.url {
            CachedAsyncImage(
              url: URL(string: strongUrl),
              content: { image in
                image
                  .resizable()
                  .frame(width: iconSize, height: iconSize)
                  .thumbnailMask(width: iconSize, height: iconSize)
                  .matchedGeometryEffect(id: "\(transaction.id)\(Constants.Animations.iconSuffix)", in: animationNamespace)
                  .padding(.top, 98)
              }, placeholder: {
                imagePlaceholder
              }
            )
          } else {
            Image
              .imageAssets(fromString: transaction.largeIcon.category)
              .resizable()
              .matchedGeometryEffect(id: "\(transaction.id)\(Constants.Animations.iconSuffix)", in: animationNamespace)
              .frame(width: iconSize, height: iconSize)
              .padding(.top, 98)
          }

          if let strongUrl = transaction.smallIcon.url {
            CachedAsyncImage(
              url: URL(string: strongUrl),
              content: { image in
                BadgeIconView(image: image, imageSize: CGSize(width: 18, height: 18), backgroundSize: CGSize(width: 30, height: 30))
                .matchedGeometryEffect(id: "\(transaction.id)\(Constants.Animations.badgeSuffix)", in: animationNamespace)
                .bottomRight()
                .offset(y: 15)
                .offset(x: -29)
              }, placeholder: {
                imagePlaceholder
              }
            )
          } else {
            BadgeIconView(image: Image.imageAssets(fromString: transaction.smallIcon.category), imageSize: CGSize(width: 18, height: 18), backgroundSize: CGSize(width: 30, height: 30))
              .matchedGeometryEffect(id: "\(transaction.id)\(Constants.Animations.badgeSuffix)", in: animationNamespace)
              .bottomRight()
              .offset(y: 15)
              .offset(x: -29)
          }
        }
      }
    }

  var closeButton: some View {
    VStack {
      HStack {
        Image
          .imageAssets(fromImageAssets: .chevron_down)
          .padding(.top, 53)
          .padding(.leading, 20)
        Spacer()
      }
      Spacer()
    }
    .opacity(showCloseButton ? 1 : 0)
  }

  var imagePlaceholder: some View {
    Rectangle().fill(Color.colorAssets(.gray_color)).thumbnailMask(width: iconSize, height: iconSize)
  }

}

struct TransactionDetailsTopView_Previews: PreviewProvider {

  @Namespace static var namespace

    static var previews: some View {
      TransactionDetailsTopView(store: Store(
        initialState: TransactionsStore.State(),
        reducer: TransactionsStore()._printChanges()
      ), transaction: Transaction.mock, animationNamespace: namespace, showCloseButton: .constant(true), showDetails: .constant(true), showActions: .constant(true))
    }
}
