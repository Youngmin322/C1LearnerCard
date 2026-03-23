//
//  CardUI.swift
//  LearnerCard
//
//  Created by Youngmin Cho on 3/22/26.
//

import SwiftUI

struct CardUI: View {
    var learnerCard: cardData
    
    var body: some View {
        VStack {
            HStack {
                Circle()
                    .frame(width: 40, height: 40)
                    .overlay(
                        Text(String(learnerCard.nickName.prefix(1)))
                            .foregroundColor(.white)
                            .bold()
                        )
                    .foregroundColor(.blue)
                
                VStack(alignment: .leading) {
                    Text(learnerCard.name)
                        .bold()
                    
                    Text(learnerCard.nickName)
                }
                
                Spacer()
                
                Text(learnerCard.session)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 4)
                    .background(Capsule().fill(Color.blue.opacity(0.15)))
                    .foregroundColor(.blue)
                    .font(.caption)
            }
            
            Divider()
            
            HStack {
                Text("전화번호")
                    .foregroundColor(.gray)
                    .font(.subheadline)
                
                Spacer()
                
                Text(learnerCard.phone)
                    .font(.subheadline)
            }
            
            Divider()
            
            VStack(alignment: .leading, spacing: 4) {
                Text("진진가")
                    .font(.caption)
                    .foregroundColor(.gray)
                
                ForEach(learnerCard.descriptions, id: \.self) { description in
                    Text("•\(description)")
                        .font(.subheadline)
                        .padding(.horizontal)
                }
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.1), radius: 8, x: 0, y: 2)
        .padding()
    }
}

#Preview {
    CardUI(learnerCard: cardData(name: "조영민", nickName: "Owen", session: "오전", phone: "010-9659-9798", descriptions: ["진진가 1", "진진가 2"]))
}
