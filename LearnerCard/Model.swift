//
//  Model.swift
//  LearnerCard
//
//  Created by Youngmin Cho on 3/20/26.
//

import Foundation

struct cardData: Identifiable {
    let id = UUID()
    var name: String
    var nickName: String
    var session: String
    var profileImageURL: String?
    
    var phone: String
    var descriptions: [String]
}
