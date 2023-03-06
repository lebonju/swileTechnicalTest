//
//  ImageAssets.swift
//  SwileTechnicalTest
//
//  Created by Julien Forestier on 24/02/2023.
//

import Foundation
import SwiftUI

// swiftlint:disable identifier_name
enum ImageAssets: String {
  // Transactions
  case bakery
  case burger
  case computer
  case gift
  case meal_voucher
  case mobility
  case supermarket
  case sushi
  case train

  // Transaction details
  case chevron_down
  case help
  case heart
  case share

  // Mask
  case transaction_thumbnail_mask
  case transaction_thumbnail_mask_border
}

extension Image {
  static func imageAssets(fromString name: String) -> Image {
    return Image(name)
  }

  static func imageAssets(fromImageAssets name: ImageAssets) -> Image {
    return Image(name.rawValue)
  }
}
