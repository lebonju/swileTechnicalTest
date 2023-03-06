//
//  FloatToString.swift
//  SwileTechnicalTest
//
//  Created by Julien Forestier on 24/02/2023.
//

import Foundation

extension Float {
  func toStringWithTwoDecimal() -> String {
    return String(format: "%.2f", self)
  }
}
