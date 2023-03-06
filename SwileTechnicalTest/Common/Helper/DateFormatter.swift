//
//  ShortDateFormatter.swift
//  SwileTechnicalTest
//
//  Created by Julien Forestier on 24/02/2023.
//

import Foundation

// swiftlint:disable identifier_name
extension DateFormatter {
  static func ShortDateFormatter() -> DateFormatter {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "d MMMM"
    return dateFormatter
  }

  static func LongDateFormatter() -> DateFormatter {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "EEEE d MMMM, HH:mm"
    return dateFormatter
  }

  static func MonthDateFormatter() -> DateFormatter {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MMMM"
    return dateFormatter
  }
}
