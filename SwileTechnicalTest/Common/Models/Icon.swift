//
//  Icon.swift
//  SwileTechnicalTest
//
//  Created by Julien Forestier on 27/02/2023.
//

import Foundation

struct Icon: Codable, Equatable {
  var url: String?
  var category: String

  func hasUrl() -> Bool {
    return url != nil
  }
}
