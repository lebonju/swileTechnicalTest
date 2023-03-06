//
//  Currency.swift
//  SwileTechnicalTest
//
//  Created by Julien Forestier on 27/02/2023.
//

import Foundation

struct Currency: Codable, Equatable {
  var iso3: String
  var symbol: String
  var title: String

  private enum CodingKeys: String, CodingKey {
    case iso3 = "iso_3", symbol, title
  }
}
