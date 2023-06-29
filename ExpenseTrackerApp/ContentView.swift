//
//  ContentView.swift
//  ExpenseTrackerApp
//
//  Created by Rohit Patil on 21/06/23.
//

import SwiftUI
import SwiftUICharts

struct ContentView: View {
    @EnvironmentObject var transactionListVM:TransactionListViewModel
    var demoData:[Double] = [8,2,4,6,12,9,2]
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(alignment:.leading,spacing: 24){
                    //MARK: Title
                    Text("OverView")
                        .font(.title2)
                        .bold()
                    
                    //MARK: Charts
                    let data = transactionListVM.accumulateTransaction()
                    if !data.isEmpty{
                        let totalExpenses = data.last?.1 ?? 0
                        
                        CardView {
                            VStack{
                                ChartLabel(totalExpenses.formatted(.currency(code: "USD")),type: .title)
                                LineChart()
                            }
                            .background(Color.systemBackground)
                        }
                        .data(data)
                        .chartStyle(ChartStyle(backgroundColor: Color.systemBackground, foregroundColor: ColorGradient(Color.blue.opacity(0.4),Color.blue)))
                        .frame(height:300)
                    }
                    
                  
                    
                    //MARK: TransactionList
                    RecentTransactionList()
                }
                .padding()
                .frame(maxWidth:.infinity)
            }
            .background(Color.background)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                //MARK: Notification Icon
                ToolbarItem{
                    Image(systemName: "bell.badge")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(Color.icon,.primary)
                }
            }
        }
        .navigationViewStyle(.stack)
        .accentColor(.primary)
    }
}

struct ContentView_Previews: PreviewProvider {
    static let transactionListVM : TransactionListViewModel = {
        let transactionListVM = TransactionListViewModel()
        transactionListVM.transactions = transactionListPreviewData
        return transactionListVM
    }()
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
                .preferredColorScheme(.dark)
        }
        .environmentObject(transactionListVM)
    }
}
