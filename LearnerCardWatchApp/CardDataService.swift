//
//  CardDataService.swift
//  LearnerCard
//
//  Created by Youngmin Cho on 4/14/26.
//

import Foundation
import WatchConnectivity

class CardDataService: NSObject, WCSessionDelegate {
    var cardDTO: CardDTO?
    static let shared = CardDataService()
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: (any Error)?) {
    }
    
    func session(_ session: WCSession, didReceiveApplicationContext applicationContext: [String : Any]) {
        if let data = applicationContext["card"] as? Data {
            cardDTO = try? JSONDecoder().decode(CardDTO.self, from: data)
        }
    }
    
    override init() {
        super.init()
        WCSession.default.delegate = self
        WCSession.default.activate()
    }
}
