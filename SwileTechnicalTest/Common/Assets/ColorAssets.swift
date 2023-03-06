//
//  AssetsColor.swift
//  SwileTechnicalTest
//
//  Created by Julien Forestier on 24/02/2023.
//

import SwiftUI

// swiftlint:disable identifier_name
enum ColorAssets: String {
  case blue_color
  case gray_color
  case transaction_positive_amount_background_color
  case transaction_positive_amount_color
  case transaction_detail_action_color
  case transaction_detail_action_border_color
  case image_border_color
}

extension Color {
  static func colorAssets(_ name: ColorAssets) -> Color {
    return Color(name.rawValue)
  }

  static func borderColorFromAssetsName(_ name: String) -> Color {
    return Color("\(name)_border_color")
  }

  static func colorFromAssetsName(_ name: String) -> Color {
    return Color(name)
  }
}
