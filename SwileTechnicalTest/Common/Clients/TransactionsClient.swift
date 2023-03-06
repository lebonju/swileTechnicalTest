//
//  TransactionsClient.swift
//  SwileTechnicalTest
//
//  Created by Julien Forestier on 23/02/2023.
//

import Foundation
import Combine
import ComposableArchitecture

struct TransactionsClient {
  var loadTransactions: (_ page: Int) async throws -> Transactions
}

extension DependencyValues {
  var transactionsClient: TransactionsClient {
    get { self[TransactionsClient.self] }
    set { self[TransactionsClient.self] = newValue }
  }
}

extension TransactionsClient: DependencyKey {
  static let liveValue = TransactionsClient(
    loadTransactions: { page in
      return try await TransactionsApi().getTransactions(page: page)
    }
  )
}

extension TransactionsClient: TestDependencyKey {
  static let previewValue = Self(
    loadTransactions: { _ in .mock }
  )

  static let testValue = Self(
    loadTransactions: { _ in .mock }
  )
}

extension Transactions {
  static let mock = Transactions(
    results: [
      Transaction(
        name: "Restos du coeur",
        type: "donation",
        date: Date.dateFromIso(isoValue: "2021-03-07T14:04:45.000+01:00")!,
        message: "Don à l'arrondi",
        amount: Amount(
          value: -0.07,
          currency: Currency(
            iso3: "EUR", symbol: "€", title: "Euro"
          )
        ),
        smallIcon: Icon(url: nil, category: "meal_voucher"),
        largeIcon: Icon(url: "https://res.cloudinary.com/hbnjrwllw/image/upload/v1583240999/neobank/charity/cdaa7851-da33-4b3c-8e01-228c4b085ac3.png", category: "donation")
      ),
      Transaction(
        name: "Sushi WA",
        type: "meal_voucher",
        date: Date.dateFromIso(isoValue: "2021-03-07T12:04:45.000+01:00")!,
        message: nil,
        amount: Amount(
          value: -18.63,
          currency: Currency(
            iso3: "EUR", symbol: "€", title: "Euro"
          )
        ),
        smallIcon: Icon(url: nil, category: "meal_voucher"),
        largeIcon: Icon(url: nil, category: "sushi")
      ),
      Transaction(
        name: "FNAC",
        type: "gift",
        date: Date.dateFromIso(isoValue: "2021-03-07T10:04:45.000+01:00")!,
        message: nil,
        amount: Amount(
          value: -49.9,
          currency: Currency(
            iso3: "EUR", symbol: "€", title: "Euro"
          )
        ),
        smallIcon: Icon(url: nil, category: "gift"),
        largeIcon: Icon(url: nil, category: "computer")
      ),
      Transaction(
        name: "Jean-Michel",
        type: "payment",
        date: Date.dateFromIso(isoValue: "2021-01-01T18:34:45.000+01:00")!,
        message: "Remboursement du repas d'hier",
        amount: Amount(
          value: 15,
          currency: Currency(
            iso3: "EUR", symbol: "€", title: "Euro"
          )
        ),
        smallIcon: Icon(url: "https://res.cloudinary.com/hbnjrwllw/image/upload/user_picture_146749", category: "payment"),
        largeIcon: Icon(url: "https://res.cloudinary.com/hbnjrwllw/image/upload/user_picture_151660", category: "payment")
      )
    ]
  )
}

extension Transaction {
  static let mock = Transaction(
    name: "Sushi WA",
    type: "meal_voucher",
    date: Date.dateFromIso(isoValue: "2021-03-07T12:04:45.000+01:00")!,
    message: nil,
    amount: Amount(
      value: -18.63,
      currency: Currency(
        iso3: "EUR", symbol: "€", title: "Euro"
      )
    ),
    smallIcon: Icon(url: nil, category: "meal_voucher"),
    largeIcon: Icon(url: nil, category: "sushi")
  )
}
