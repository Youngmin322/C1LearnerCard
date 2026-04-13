//
//  Card​Exchange​ViewModel.swift
//  LearnerCard
//
//  Created by Youngmin Cho on 4/7/26.
//

import Foundation
import SwiftUI
import Combine
import SwiftData

@Observable
class CardExchangeViewModel {
    var myCard: Card
    var dotCount: Int = 0
    var dotTimer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    var isConnected: Bool = false

    var connectionService: ConnectionService?
    var yourName = ""
    var NearbySession: Nearbysession?
    var nearDistance: Float?
    
    var modelContext: ModelContext?
    
    func sendCard(_ card: Card) {
        connectionService?.sendCard(myCard)
    }
    
    init(myCard: Card) {
        self.myCard = myCard
    }
}
