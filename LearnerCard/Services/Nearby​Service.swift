//
//  Nearby​Service.swift
//  LearnerCard
//
//  Created by Youngmin Cho on 3/29/26.
//

import Foundation
import NearbyInteraction
import MultipeerConnectivity

class Nearbysession: NSObject, NISessionDelegate {
    private let session: NISession
    var peerDiscoveryToken: NIDiscoveryToken?
    
    var myToken: NIDiscoveryToken? {
        return session.discoveryToken
    }
    
    var onDistanceUpdated: ((Float) -> Void)?
    
    override init() {
        session = NISession()
        super.init()
        session.delegate = self
    }
    
    func session(_ session: NISession, didUpdate nearbyObjects: [NINearbyObject]) {
        guard let peerToken = peerDiscoveryToken else {
            fatalError("don't have peer token")
        }

        let peerObj = nearbyObjects.first { (obj) -> Bool in
            return obj.discoveryToken == peerToken
        }

        guard let nearbyObjectUpdate = peerObj else {
            return
        }
        if let distance = nearbyObjectUpdate.distance {
            onDistanceUpdated?(distance)
        }
    }
    
    func start(peerToken: NIDiscoveryToken) {
        peerDiscoveryToken = peerToken
        let config = NINearbyPeerConfiguration(peerToken: peerToken)
            session.run(config)
    }
}
