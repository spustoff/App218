//
//  StatisticsViewModel.swift
//  App218
//
//  Created by IGOR on 12/10/2023.
//

import SwiftUI

final class StatisticsViewModel: ObservableObject {

    @Published var periods: [String] = ["W", "M", "Y"]
    @Published var cur_per = "W"
    
    @Published var days: [String] = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
    @Published var months: [String] = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19"]
    @Published var year: [String] = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
    
    @Published var valuts: [String] = ["EURUSD", "USDJPY", "AUDUSD", "USDCAD"]
    @Published var selected_valut = "EURUSD"

}

