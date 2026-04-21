//
//  CardView.swift
//  LearnerCard
//
//  Created by Youngmin Cho on 3/22/26.
//

import SwiftUI

struct CardView: View {
    var learnerCard: Card
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
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
                
                Text(learnerCard.phone ?? "없음")
                    .font(.subheadline)
            }
            
            Divider()
            
            VStack(alignment: .leading, spacing: 4) {
                Text("추가 정보")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                ForEach(learnerCard.descriptions, id: \.self) { description in
                    Text("\(description)")
                        .font(.subheadline)
                        .padding(.horizontal)
                }
            }
        }
        .padding()
        #if os(watchOS)
        .frame(width: 190, height: 150)
        #else
        .frame(width: 350, height: 190)
        #endif
        .glassEffect(.regular, in: .rect(cornerRadius: 20))
        .contentShape(Rectangle())
        .padding()
    }
}

#Preview {
    CardView(learnerCard: Card(name: "조영민", nickName: "Owen", session: "오전", profileImageURL: nil, phone: nil, descriptions: [""], isMine: true))
}
