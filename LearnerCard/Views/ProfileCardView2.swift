//
//  ProfileCardView2.swift
//  LearnerCard
//
//  Created by Youngmin Cho on 4/22/26.
//

import SwiftUI
import SwiftData

struct ProfileCardView2: View {
    @State private var isEditing = false
    @State private var showExchange = false
    @Query(filter: #Predicate<Card> { $0.isMine == true })
    private var myCards: [Card]
    var existingCard: Card? = nil
    
    var body: some View {
        VStack(spacing: 20) {
            if let myCard = myCards.first {
                // 프로필 이미지
                Circle()
                    .stroke(Color.gray.opacity(0.4), lineWidth: 2)
                    .frame(width: 120, height: 120)
                    .overlay(
                        Image(systemName: "person.fill")
                            .font(.system(size: 50))
                            .foregroundColor(.gray)
                    )
                
                // 이름 + 닉네임
                VStack(spacing: 4) {
                    Text(myCard.name)
                        .font(.title)
                        .bold()
                    Text(myCard.nickName)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
                // 세션
                Text(myCard.session)
                    .padding(.horizontal, 14)
                    .padding(.vertical, 6)
                    .background(Capsule().fill(Color.blue.opacity(0.15)))
                    .foregroundColor(.blue)
                    .font(.subheadline)
                
                // 상세 정보 카드
                VStack(spacing: 12) {
                    HStack {
                        Text("전화번호")
                            .foregroundColor(.gray)
                        Spacer()
                        Text(myCard.phone ?? "없음")
                    }
                    .font(.subheadline)
                    
                    Divider()
                    
                    VStack(alignment: .leading, spacing: 6) {
                        Text("관심 기술 및 관심 분야")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        ForEach(myCard.descriptions, id: \.self) { desc in
                            Text(desc)
                                .font(.subheadline)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding()
                .glassEffect(.regular, in: .rect(cornerRadius: 16))
                .padding(.horizontal)
                
                Spacer()
            } else {
                Text("아직 내 카드가 없어요! \n 카드를 만들어 보세요!")
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                if myCards.isEmpty {
                    Button(action: { isEditing = true }) {
                        Image(systemName: "plus")
                    }
                }
            }
        }
        .navigationTitle("프로필")
        .sheet(isPresented: $isEditing) {
            if myCards.isEmpty {
                NavigationStack {
                    CardFormView(isEditing: $isEditing)
                }
            } else {
                NavigationStack {
                    CardFormView(isEditing: $isEditing, existingCard: myCards.first)
                }
            }
        }
    }
}


#Preview {
    ProfileCardView2()
        .modelContainer(for: Card.self, inMemory: true)
}
