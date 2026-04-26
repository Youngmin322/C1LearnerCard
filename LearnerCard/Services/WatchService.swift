//
//  WatchService.swift
//  LearnerCard
//
//  Created by Youngmin Cho on 4/14/26.
//

import Foundation
import WatchConnectivity


class WatchService: NSObject, WCSessionDelegate {
    static let shared = WatchService()
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: (any Error)?) { }
    
    func sessionDidBecomeInactive(_ session: WCSession) { }
    
    func sessionDidDeactivate(_ session: WCSession) { }
    
    override init() {
        super.init()
        WCSession.default.delegate = self
        WCSession.default.activate()
    }
    
    func sendCard(_ card: Card) {
        print("보냄 시도")
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(card.toDTO()) {
            try? WCSession.default.updateApplicationContext(["card": data])
            print("보냄 성공")
        }
    }
}
