//
//  YourFinanceTrackerApp.swift
//  YourFinanceTracker
//
//  Created by Parvana Jananova on 17.06.26.
//
import SwiftUI

@main
struct YourFinanceTrackerApp: App {

    private let repository = TransactionRepositoryImpl()

    var body: some Scene {
        WindowGroup {
            ContentView(repository: repository)
        }
    }
}
