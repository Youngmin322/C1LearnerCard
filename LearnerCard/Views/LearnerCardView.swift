//
//  ContentView.swift
//  LearnerCard
//
//  Created by Youngmin Cho on 3/20/26.
//

import SwiftUI
import SwiftData

struct LearnerCardView: View {
    
    @State var selectedIndex: Int? = nil
    @Environment(\.modelContext) private var modelContext
    @Query private var Data: [cardData]
    var searchText: String = ""
    
    private var filteredCardData: [cardData] {
        if searchText.isEmpty {
            return Data
        } else {
            return Data.filter { CD in
                CD.nickName.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            if Data.isEmpty {
                VStack {
                    Text("아직 러너카드가 없어요! \n 러너를 만나서 교환해보세요!")
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                }
            } else {
                ScrollView {
                    VStack(spacing: 0) {
                        ForEach(Array(filteredCardData.enumerated()), id:\.element.id) { index, item in
                            GeometryReader { geo in
                                let minY = geo.frame(in: .global).minY
                                let offsetY = max(0, 100 - minY)
                                
                                CardUI(learnerCard: item)
                                    .frame(maxWidth: .infinity, alignment: .center)
                                    .offset(y: offsetY)
                                    .onTapGesture {
                                        withAnimation(.spring()) {
                                            if selectedIndex == index {
                                                selectedIndex = nil
                                            } else {
                                                selectedIndex = index
                                            }
                                        }
                                    }
                                    .zIndex(selectedIndex == index ? 1 : 0)
                            }
                            .frame(height: 200, alignment: .center)
                        }
                    }
                }
                .navigationTitle("러너 카드")
                .onAppear {
                    if Data.isEmpty {
                        modelContext.insert(cardData(id: UUID(), name: "조영민", nickName: "Owen", session: "오전", profileImageURL: "", phone: "010-1111-2222", descriptions: ["진진가11","진진가1"]))
                        modelContext.insert(cardData(id: UUID(), name: "백지훈", nickName: "John", session: "오전", profileImageURL: "", phone: "010-1111-2222", descriptions: ["진진가22","진진가2"]))
                        modelContext.insert(cardData(id: UUID(), name: "김가은", nickName: "Gani", session: "오전", profileImageURL: "", phone: "010-1111-2222", descriptions: ["진진가33","진진가3"]))
                    }
                }
            }
        }
        .onAppear {
            if Data.isEmpty {
                modelContext.insert(cardData(id: UUID(), name: "조영민", nickName: "Owen", session: "오전", profileImageURL: "", phone: "010-1111-2222", descriptions: ["진진가11","진진가1"]))
                modelContext.insert(cardData(id: UUID(), name: "백지훈", nickName: "John", session: "오전", profileImageURL: "", phone: "010-1111-2222", descriptions: ["진진가22","진진가2"]))
                modelContext.insert(cardData(id: UUID(), name: "김가은", nickName: "Ganni", session: "오전", profileImageURL: "", phone: "010-1111-2222", descriptions: ["진진가33","진진가3"]))
                modelContext.insert(cardData(id: UUID(), name: "김가은", nickName: "Ganni", session: "오전", profileImageURL: "", phone: "010-1111-2222", descriptions: ["진진가33","진진가3"]))
                modelContext.insert(cardData(id: UUID(), name: "김가은", nickName: "Ganni", session: "오전", profileImageURL: "", phone: "010-1111-2222", descriptions: ["진진가33","진진가3"]))
                modelContext.insert(cardData(id: UUID(), name: "김가은", nickName: "Ganni", session: "오전", profileImageURL: "", phone: "010-1111-2222", descriptions: ["진진가33","진진가3"]))
                modelContext.insert(cardData(id: UUID(), name: "김가은", nickName: "Ganni", session: "오전", profileImageURL: "", phone: "010-1111-2222", descriptions: ["진진가33","진진가3"]))
                modelContext.insert(cardData(id: UUID(), name: "이치훈", nickName: "Gosan", session: "오전", profileImageURL: "", phone: "010-1111-2222", descriptions: ["옵셔널 비유 때 유대인 족쇄로 비유함"]))
            }
        }
    }
}

#Preview {
    LearnerCardView()
        .modelContainer(for: cardData.self, inMemory: true)
}



