//
//  Model.swift
//  LearnerCard
//
//  Created by Youngmin Cho on 3/20/26.
//

import Foundation
import SwiftData

@Model
final class Card: Identifiable {
    var id = UUID()
    var name: String
    var nickName: String
    var session: String
    var profileImageURL: String?
    var phone: String?
    var descriptions: [String]
    var isMine: Bool
    
    init(
        id: UUID = UUID(),
        name: String,
        nickName: String,
        session: String,
        profileImageURL: String?,
        phone: String?,
        descriptions: [String],
        isMine: Bool
    ) {
        self.id = id
        self.name = name
        self.nickName = nickName
        self.session = session
        self.profileImageURL = profileImageURL
        self.phone = phone
        self.descriptions = descriptions
        self.isMine = isMine
    }
    
    init(from dto: CardDTO) {
        self.name = dto.name
        self.nickName = dto.nickName
        self.session = dto.session
        self.profileImageURL = dto.profileImageURL
        self.phone = dto.phone
        self.descriptions = dto.descriptions
        self.isMine = false
    }
    
    func toDTO() -> CardDTO {
        return CardDTO(name: self.name, nickName: self.nickName, session: self.session, profileImageURL: self.profileImageURL, phone: self.phone, descriptions: self.descriptions)
    }
}

struct CardDTO: Codable {
    var id = UUID()
    var name: String
    var nickName: String
    var session: String
    var profileImageURL: String?
    var phone: String?
    var descriptions: [String]
}
