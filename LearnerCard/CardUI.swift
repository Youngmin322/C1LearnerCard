//
//  CardUI.swift
//  LearnerCard
//
//  Created by Youngmin Cho on 3/22/26.
//

import SwiftUI

let card: [cardData] = [
    cardData(name: "조영민",
             nickName: "Owen",
             session: "오전",
             phone: "010-9659-9798",
             descriptions: ["진진가1", "진진가2", "진진가3"]
             ),
    cardData(name: "김애플",
             nickName: "러너",
             session: "오후",
             phone: "010-1111-2222",
             descriptions: ["진진진"]
            )
]

struct CardUI: View {
    var body: some View {
        VStack {
            HStack {
                Circle()
                    .frame(width: 40, height: 40)
                    .overlay(
                        Text("조")
                            .foregroundColor(.white)
                            .bold()
                    )
                    .foregroundColor(.blue)
                
                VStack(alignment: .leading) {
                    Text(card[0].name)
                        .bold()
                    
                    Text(card[0].nickName)
                }
                
                Spacer()
                
                Text(card[0].session)
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
                
                Text(card[0].phone)
                    .font(.subheadline)
            }
            
            Divider()
            
            VStack(alignment: .leading, spacing: 4) {
                Text("진진가")
                    .font(.caption)
                    .foregroundColor(.gray)
                
                ForEach(card[0].descriptions, id: \.self) { description in
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
    CardUI()
}
