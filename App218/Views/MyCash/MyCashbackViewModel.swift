//
//  MyCashbackViewModel.swift
//  App218
//
//  Created by IGOR on 10/10/2023.
//

import SwiftUI
import CoreData

final class MyCashbackViewModel: ObservableObject {

    @Published var current_card: CardModel?
    @Published var cards: [CardModel] = []
    @Published var isDetail: Bool = false
    @Published var isFavs: Bool = false
    
    @Published var isAddCash: Bool = false
    @Published var isAddCard: Bool = false

    @AppStorage("saved_cards") var saved_cards: [String] = []
    @AppStorage("histiryVisa") var histiryVisa: [String] = []
    @AppStorage("histiryMasterCard") var histiryMasterCard: [String] = []
    @AppStorage("histiryQIWI") var histiryQIWI: [String] = []
    @AppStorage("histiryGooglePay") var histiryGooglePay: [String] = []
    
    @Published var currentHaventCard = ""
    
    func getItems() -> [CardModel] {

        switch isFavs {

        case true:
            return cards.filter{saved_cards.contains($0.cardType ?? "")}
        case false:
            return cards
        }
    }
    
    func fetchHistory() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<CardModel>(entityName: "CardModel")

        do {
            
            let persons = try context.fetch(fetchRequest)
            
            self.cards = persons
            
        } catch let error as NSError {
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.cards = []
        }
    }

    
}


