//
//  Transaction.swift
//  SwileTechnicalTest
//
//  Created by Julien Forestier on 22/02/2023.
//

import Foundation

struct Transactions: Codable, Equatable {

  var results: [Transaction]

  enum CodingKeys: String, CodingKey {
    case results = "transactions"
  }

  func transactionSections() -> [TransactionSection] {
    guard !results.isEmpty else { return [] }

    var sortedResults = results
    sortedResults.sort(by: {$0.date.compare($1.date) == .orderedDescending})

    var results = [TransactionSection]()
    for item in sortedResults {
      let monthName = item.monthName()
      if let index = results.firstIndex(where: {$0.name == monthName}) {
        results[index].transactions.append(item)
      } else {
        var transactionSection = TransactionSection(name: monthName, transactions: [])
        transactionSection.transactions.append(item)
        results.append(transactionSection)
      }
    }
    return results
  }

  func isLastItem(_ id: String) -> Bool {
    let itemIndex = results.firstIndex(where: { $0.id == id })
    return itemIndex == results.endIndex - 1
  }

}
