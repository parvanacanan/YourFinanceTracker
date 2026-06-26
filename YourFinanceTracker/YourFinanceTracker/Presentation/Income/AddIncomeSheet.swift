//
//  AddIncomeSheet.swift
//  YourFinanceTracker
//
//  Created by Parvana Jananova on 25.06.26.
//

import SwiftUI

struct AddIncomeSheet: View {

    @Environment(\.dismiss) private var dismiss

    @State private var title = ""
    @State private var description = ""
    @State private var amount = ""

    let onSave: (Transaction) -> Void

    var body: some View {

        NavigationStack {

            Form {

                TextField("Title", text: $title)

                TextField(
                    "Description",
                    text: $description
                )

                TextField(
                    "Amount",
                    text: $amount
                )
                .keyboardType(.decimalPad)
            }
            .navigationTitle("Add Expense")
            .toolbar {

                ToolbarItem(placement: .topBarTrailing) {

                    Button("Save") {

                        guard let amount = Double(amount)
                        else { return }

                        let transaction = Transaction(
                            id: UUID(),
                            title: title,
                           transactionDescription:  description,
                            amount: amount,
                            date: .now, type: .income
                        )

                        onSave(transaction)

                        dismiss()
                    }
                }
            }
        }
    }
}
