//
//  SwileTechnicalTestApp.swift
//  SwileTechnicalTest
//
//  Created by Julien Forestier on 22/02/2023.
//

import SwiftUI
import ComposableArchitecture

@main
struct SwileTechnicalTestApp: App {
    var body: some Scene {
        WindowGroup {
            TransactionsView(
              store: Store(
                initialState: TransactionsStore.State(),
                reducer: TransactionsStore()._printChanges()
              ))
        }
    }
}
