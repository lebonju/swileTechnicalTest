//
//  BottomRight.swift
//  SwileTechnicalTest
//
//  Created by Julien Forestier on 04/03/2023.
//

import Foundation
import SwiftUI

struct BottomRight: ViewModifier {

  func body(content: Content) -> some View {
    VStack {
      Spacer()
      HStack {
        Spacer()
        content
      }
    }
  }
}

extension View {
  func bottomRight() -> some View {
    modifier(BottomRight())
  }
}
