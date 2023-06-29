//
//  TransactionRow.swift
//  ExpenseTrackerApp
//
//  Created by Rohit Patil on 21/06/23.
//

import SwiftUI
import Awesome


struct TransactionRow: View {
    var transaction:Transaction
    var body: some View {
        HStack(spacing:20){
            //MARK: Transaction Category Icon
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Color.icon)
                .opacity(0.3)
                .frame(width:44,height: 44)
                .overlay(
                    Awesome.Regular.chartBar.image
                        .size(24)
                        .foregroundColor(Color.icon)
                
               
                )
            
            VStack(alignment:.leading,spacing: 6){
                //MARK: Transaction Marchant
                Text(transaction.merchant)
                    .font(.subheadline)
                    .bold()
                    .lineLimit(1)
                
                //MARK: Transaction Category
                Text(transaction.category)
                    .font(.footnote)
                    .opacity(0.7)
                    .lineLimit(1)
                
                //MARK: Transaction Date
                Text(transaction.dateParsed,format: .dateTime.year().month().day())
                    .font(.footnote)
                    .foregroundColor(.secondary )
            }
            Spacer()
            //MARK: Transaction Amount
            Text(transaction.signedAmount,format: .currency(code: "USD"))
                .bold()
                .foregroundColor(transaction.type == TransactionType.credit.rawValue ? Color.text : .primary )
                
        }
        .padding([.top,.bottom],8)
    }
}

struct TransactionRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TransactionRow(transaction: transactionPreviewData)
            TransactionRow(transaction: transactionPreviewData)
                .preferredColorScheme(.dark)
        }
    }
}
