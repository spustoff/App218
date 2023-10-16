//
//  NewCardViewModel.swift
//  App218
//
//  Created by IGOR on 12/10/2023.
//

import SwiftUI
import CoreData

final class NewCardViewModel: ObservableObject {
    
    @Published var card_types: [String] = ["VISA", "MasterCard", "QIWI", "Google Pay"]
    @Published var currerntCardType = "VISA"
    @Published var whichAirline: String = ""
//    @Published var search: String = ""
//    @Published var isAirlines: Bool = false
    
    @Published var cardBalance: String = ""
    @Published var cardType: String = ""
    
    @AppStorage("histiryVisa") var histiryVisa: [String] = []
    @AppStorage("histiryMasterCard") var histiryMasterCard: [String] = []
    @AppStorage("histiryQIWI") var histiryQIWI: [String] = []
    @AppStorage("histiryGooglePay") var histiryGooglePay: [String] = []
    @Published var cashSum: String = ""
    @Published var cashTitle: String = ""

    
    @Published var cardNumber: String = ""
    
//    @Published var distance: Int = Int.random(in: 1000...5000)
    
    func addToHistory(completion: @escaping () -> (Void)) {
        
        print(whichAirline)
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let flight = NSEntityDescription.insertNewObject(forEntityName: "CardModel", into: context) as! CardModel
        
        flight.cardBalance = Int32(Int(cardBalance) ?? 0)
        flight.cardType = currerntCardType
        flight.cardNumber = cardNumber

        
        CoreDataStack.shared.saveContext()
        
        completion()
    }
    
    
//    @Published var airlines: [airline] = [
//
//        .s7, .flyamirates, .southwind, .flyturkiye, .aeroflot, .pobeda, .nordwind, .flyazerbayjan
//    ]
//
//    public func returnFilteredAirlines() -> [airline] {
//
//        switch search.isEmpty {
//
//        case true:
//            return airlines
//
//        case false:
//            return airlines.filter{$0.text.lowercased().contains(search.lowercased())}
//        }
//    }
//}

//enum airline: CaseIterable {
//
//    case s7, flyamirates, southwind, flyturkiye, aeroflot, pobeda, nordwind, flyazerbayjan
//
//    var text: String {
//
//        switch self {
//
//        case .s7:
//            return "S7"
//        case .flyamirates:
//            return "FlyEmirates"
//        case .southwind:
//            return "SouthWind"
//        case .flyturkiye:
//            return "FlyTurliye"
//        case .aeroflot:
//            return "Aeroflot"
//        case .pobeda:
//            return "Pobeda"
//        case .nordwind:
//            return "NordWInd"
//        case .flyazerbayjan:
//            return "FlyAzerbayjan"
//        }
//    }
}

