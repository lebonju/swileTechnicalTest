//
//  Amount.swift
//  SwileTechnicalTest
//
//  Created by Julien Forestier on 27/02/2023.
//

import Foundation

struct Amount: Codable, Equatable {
  var value: Float
  var currency: Currency

  func formattedValue() -> String {
    return "\(positive() ? "+ " : "")\(value.toStringWithTwoDecimal()) \(currency.symbol)"
  }

  func positive() -> Bool {
    return value > 0
  }
}
