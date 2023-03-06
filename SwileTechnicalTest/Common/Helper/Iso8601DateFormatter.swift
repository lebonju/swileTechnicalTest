//
//  DateFormatter.swift
//  SwileTechnicalTest
//
//  Created by Julien Forestier on 25/02/2023.
//

import Foundation

// swiftlint:disable identifier_name
extension DateFormatter {
  static func Iso8601DateFormatter() -> DateFormatter {
    let formatter = DateFormatter()
    formatter.calendar = Calendar(identifier: .iso8601)
    formatter.locale = Locale(identifier: "en_US_POSIX")
    formatter.timeZone = TimeZone(secondsFromGMT: 0)
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSXXXXX"
    return formatter
  }
}
