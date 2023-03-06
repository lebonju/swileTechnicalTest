//
//  JsonDecoder.swift
//  SwileTechnicalTest
//
//  Created by Julien Forestier on 24/02/2023.
//

import Foundation

extension JSONDecoder {
  static func withIsoDateStrategy() -> JSONDecoder {
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .formatted(DateFormatter.Iso8601DateFormatter())
    return decoder
  }
}
