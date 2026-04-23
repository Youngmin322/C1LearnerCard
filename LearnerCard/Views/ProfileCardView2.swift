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
    @State private var showPhoneEdit = false
    @State private var showSessionEdit = false
    @State private var showNameEdit = false
    @State private var showNickNameEdit = false
    @State private var showDescriptionEdit = false
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
                
                // 상세 정보 카드
                VStack(spacing: 12) {
                    Button {
                        showNickNameEdit = true
                    } label: {
                        HStack {
                            Text("닉네임")
                                .foregroundColor(.gray)
                            
                            Spacer()
                            
                            Text(myCard.nickName)
                                .foregroundColor(.primary)
                            
                            Image(systemName: "chevron.right")
                                .foregroundStyle(.gray)
                        }
                        .font(.subheadline)
                    }
                    Divider()
                    
                    Button {
                        showNameEdit = true
                    } label: {
                        HStack {
                            Text("이름")
                                .foregroundColor(.gray)
                            
                            Spacer()
                            
                            Text(myCard.name)
                                .foregroundColor(.primary)
                            
                            Image(systemName: "chevron.right")
                                .foregroundStyle(.gray)
                        }
                        .font(.subheadline)
                    }
                    
                    Divider()
                    
                    Button {
                        showSessionEdit = true
                    } label: {
                        HStack {
                            Text("세션")
                                .foregroundColor(.gray)
                            
                            Spacer()
                            
                            Text(myCard.session)
                                .foregroundColor(.primary)
                            
                            Image(systemName: "chevron.right")
                                .foregroundStyle(.gray)
                        }
                        .font(.subheadline)
                    }
                    
                    Divider()
                    
                    Button {
                        showPhoneEdit = true
                    } label: {
                        HStack {
                            Text("전화번호")
                                .foregroundColor(.gray)
                            Spacer()
                            Text(myCard.phone ?? "없음")
                                .foregroundColor(.primary)
                            Image(systemName: "chevron.right")
                                .foregroundStyle(.gray)
                        }
                        .font(.subheadline)
                    }
                    
                    Divider()
                    
                    Button {
                        showDescriptionEdit = true
                    } label: {
                        HStack {
                            VStack(alignment: .leading, spacing: 6) {
                                Text("관심 기술 및 관심 분야")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                ForEach(myCard.descriptions, id: \.self) { desc in
                                    Text(desc)
                                        .font(.subheadline)
                                        .foregroundColor(.primary)
                                }
                            }
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundStyle(.gray)
                        }
                    }
                }
                .padding()
                .glassEffect(.regular, in: .rect(cornerRadius: 16))
                .padding(.horizontal)
                
                Spacer()
                
                .sheet(isPresented: $showPhoneEdit) {
                    PhoneEditView(card: myCard)
                        .presentationDetents([.medium])
                }
                .sheet(isPresented: $showNameEdit) {
                    NameEditView(card: myCard)
                        .presentationDetents([.medium])
                }
                .sheet(isPresented: $showNickNameEdit) {
                    NickNameEditView(card: myCard)
                        .presentationDetents([.medium])
                }
                .sheet(isPresented: $showSessionEdit) {
                    SessionEditView(card: myCard)
                        .presentationDetents([.medium])
                }
                .sheet(isPresented: $showDescriptionEdit) {
                    DescriptionEditView(card: myCard)
                        .presentationDetents([.medium])
                }
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
    let container = try! ModelContainer(for: Card.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
    let card = Card(name: "조영민", nickName: "Owen", session: "오전", profileImageURL: nil, phone: "010-9659-9798", descriptions: ["Swift", "UIKit"], isMine: true)
    container.mainContext.insert(card)
    
    return ProfileCardView2()
        .modelContainer(container)
}
