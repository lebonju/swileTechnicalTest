//
//  IsoDateFormatter.swift
//  SwileTechnicalTest
//
//  Created by Julien Forestier on 24/02/2023.
//

import Foundation

extension Date {
  static func dateFromIso(isoValue: String) -> Date? {
    return DateFormatter.Iso8601DateFormatter().date(from: isoValue)
  }

  func addYear(value: Int) -> Date? {
    let calendar = Calendar.current
    let previousMonth = calendar.date(byAdding: .year, value: value, to: self)
    return previousMonth
  }

}
