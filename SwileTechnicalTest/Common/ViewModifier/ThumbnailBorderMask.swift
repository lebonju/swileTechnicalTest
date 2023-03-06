//
//  ThumbnailMask.swift
//  SwileTechnicalTest
//
//  Created by Julien Forestier on 28/02/2023.
//

import SwiftUI

struct ThumbnailBorderMask: ViewModifier {

  let width: Double
  let height: Double

  func body(content: Content) -> some View {
    content
      .mask {
        Image.imageAssets(fromImageAssets: .transaction_thumbnail_mask_border)
          .resizable()
          .frame(width: width, height: height)
      }
  }
}

extension View {
  func thumbnailBorderMask(width: Double, height: Double) -> some View {
    modifier(ThumbnailBorderMask(width: width, height: height))
  }
}
