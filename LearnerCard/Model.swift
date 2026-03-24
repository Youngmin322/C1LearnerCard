//
//  Model.swift
//  LearnerCard
//
//  Created by Youngmin Cho on 3/20/26.
//

import Foundation
import SwiftData

@Model
final class cardData: Identifiable {
    var id = UUID()
    var name: String
    var nickName: String
    var session: String
    var profileImageURL: String?
    
    var phone: String
    var descriptions: [String]
    
    init(
        id: UUID = UUID(),
        name: String,
        nickName: String,
        session: String,
        profileImageURL: String?,
        
        phone: String,
        descriptions: [String]
    ) {
        self.name = name
        self.nickName = nickName
        self.session = session
        self.profileImageURL = profileImageURL
        self.phone = phone
        self.descriptions = descriptions
    }
}
