//
//  ContentView.swift
//  LearnerCard
//
//  Created by Youngmin Cho on 3/20/26.
//

import SwiftUI
import SwiftData

struct LearnerCardView: View {
    
    @State private var selectedIndex: Int? = nil
    @Environment(\.modelContext) private var modelContext
    @Query private var cards: [Card]
    var searchText: String = ""
    
    private var filteredCardData: [Card] {
        if searchText.isEmpty {
            return cards
        } else {
            return cards.filter { card in
                card.nickName.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    var body: some View {
        Group {
            if cards.isEmpty {
                VStack {
                    Text("아직 러너카드가 없어요! \n 러너를 만나서 교환해보세요!")
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                }
            } else {
                GeometryReader { screen in
                    ScrollView {
                        VStack(spacing: 0) {
                            ForEach(Array(filteredCardData.enumerated()), id:\.element.id) { index, item in
                                GeometryReader { geo in
                                    let minY = geo.frame(in: .global).minY
                                    let offsetY = selectedIndex == nil ? max(0, 100 - minY) : (selectedIndex == index ?  175 - minY : screen.size.height * 7.0)
                                    
                                    CardView(learnerCard: item)
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
                }
            }
        }
        .navigationTitle("러너 카드")
    }
}

#Preview {
    LearnerCardView()
        .modelContainer(for: Card.self, inMemory: true)
}

