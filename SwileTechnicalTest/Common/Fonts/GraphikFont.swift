//
//  GraphikFont.swift
//  SwileTechnicalTest
//
//  Created by Julien Forestier on 24/02/2023.
//

import Foundation
import SwiftUI

let fontName = "Graphik"

let boldFontName = "\(fontName)-Bold"
let regularFontName = "\(fontName)-Regular"
let mediumFontName = "\(fontName)-Medium"
let semiBoldFontName = "\(fontName)-SemiBold"

struct GraphikFont: ViewModifier {

  let weight: Font.Weight
  let size: CGFloat

  func body(content: Content) -> some View {
    let scaledSize = UIFontMetrics.default.scaledValue(for: size)
    return content.font(.custom(fontName, size: scaledSize).weight(weight))
  }

  private var fontName: String {
    switch weight {
      case .bold:
        return boldFontName
      case .regular:
        return regularFontName
      case .medium:
        return mediumFontName
      case .semibold:
        return semiBoldFontName
      default:
        return mediumFontName
    }
  }
}

extension View {
  func graphikFont(_ weight: Font.Weight, size: CGFloat) -> some View {
    self.modifier(GraphikFont(weight: weight, size: size))
  }
}
