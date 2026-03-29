//
//  Connection​Service.swift
//  LearnerCard
//
//  Created by Youngmin Cho on 3/29/26.
//

import SwiftUI
import NearbyInteraction
import MultipeerConnectivity

class ConnectionService {
    private let myPeerID: MCPeerID
    private let session: MCSession
    private let nearbyServiceAdvertiser: MCNearbyServiceAdvertiser
    private let nearbyServiceBrowser: MCNearbyServiceBrowser
        
    init(displayName: String) {
        myPeerID = MCPeerID(displayName: displayName)
        session = MCSession(peer: myPeerID)
        nearbyServiceAdvertiser = MCNearbyServiceAdvertiser(peer: myPeerID, discoveryInfo: nil, serviceType: "learner-card")
        nearbyServiceBrowser = MCNearbyServiceBrowser(peer: myPeerID, serviceType: "learner​-card")
    }
}
