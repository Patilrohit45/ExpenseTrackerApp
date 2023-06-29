//
//  ExpenseTrackerAppApp.swift
//  ExpenseTrackerApp
//
//  Created by Rohit Patil on 21/06/23.
//

import SwiftUI

@main
struct ExpenseTrackerAppApp: App {
   @StateObject var transactionListVM = TransactionListViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(transactionListVM)
        }
    }
}
