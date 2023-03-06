//
//  Transaction.swift
//  SwileTechnicalTest
//
//  Created by Julien Forestier on 27/02/2023.
//

import Foundation

struct Transaction: Codable, Equatable, Identifiable {
  var id: String { return date.timeIntervalSince1970.description }
  var name: String
  var type: String
  var date: Date
  var message: String?
  var amount: Amount
  var smallIcon: Icon
  var largeIcon: Icon

  private enum CodingKeys: String, CodingKey {
    case name, type, date, message, amount, smallIcon = "small_icon", largeIcon = "large_icon"
  }

  func monthName() -> String {
    let monthName = DateFormatter.MonthDateFormatter().string(from: self.date).capitalized
    let calendar = Calendar.current
    let currentYear = calendar.component(.year, from: Date())
    let elementYear = calendar.component(.year, from: self.date)
    return currentYear == elementYear ? monthName : "\(monthName) \(elementYear)"
  }
  }
