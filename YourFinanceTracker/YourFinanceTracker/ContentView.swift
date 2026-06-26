//
//  ContentView.swift
//  YourFinanceTracker
//
//  Created by Parvana Jananova on 17.06.26.
//

import SwiftUI

struct ContentView: View {

    let repository: TransactionRepository

    var body: some View {

        TabView {

            DashboardView(
                store: DashboardStore(
                repository: repository
            ))
                .tabItem {
                    Label(
                        "Dashboard",
                        systemImage: "chart.bar"
                    )
                }

            ExpensesView(
                store: ExpensesStore(
                    repository: repository
                )
            )
            .tabItem {
                Label(
                    "Expenses",
                    systemImage: "minus.circle"
                )
            }

            IncomeView(
                store: IncomeStore(
                repository: repository
            ))
                .tabItem {
                    Label(
                        "Income",
                        systemImage: "plus.circle"
                    )
                }
        }
    }
}
