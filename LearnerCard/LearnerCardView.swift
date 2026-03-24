//
//  ContentView.swift
//  LearnerCard
//
//  Created by Youngmin Cho on 3/20/26.
//

import SwiftUI
import SwiftData

//let card: [cardData] = [
//    cardData(name: "조영민",
//             nickName: "Owen",
//             session: "오전",
//             profileImageURL: "", phone: "010-9659-9798",
//             descriptions: ["진진가1", "진진가2", "진진가3"]),
//    cardData(name: "존",
//             nickName: "러너",
//             session: "오후",
//             profileImageURL: "", phone: "010-1111-2222",
//             descriptions: ["진진진"]),
//    
//    cardData(name: "가니",
//             nickName: "러너",
//             session: "오후",
//             profileImageURL: "", phone: "010-1111-2222",
//             descriptions: ["진진진"]),
//    
//    cardData(name: "매버릭",
//             nickName: "러너",
//             session: "오후",
//             profileImageURL: "", phone: "010-1111-2222",
//             descriptions: ["진진진"]),
//    
//    cardData(name: "샨",
//             nickName: "러너",
//             session: "오후",
//             profileImageURL: "", phone: "010-1111-2222",
//             descriptions: ["진진진"])
//]

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
            ScrollView {
                ZStack {
                    ForEach(Array(filteredCardData.enumerated()), id:\.element.id) { index, item in
                        CardUI(learnerCard: item)
                            .offset(y: selectedIndex == nil ? CGFloat(index) * 90 : (selectedIndex == index ? 0 : CGFloat(index) * 40))
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
                }
            }
            .navigationTitle("러너 카드")
            .onAppear {
                if Data.isEmpty {
                    modelContext.insert(cardData(id: UUID(), name: "조영민", nickName: "Owen", session: "오전", profileImageURL: "", phone: "010-1111-2222", descriptions: ["진진가","진진가"]))
                    modelContext.insert(cardData(id: UUID(), name: "백지훈", nickName: "John", session: "오전", profileImageURL: "", phone: "010-1111-2222", descriptions: ["진진가","진진가"]))
                    modelContext.insert(cardData(id: UUID(), name: "김가은", nickName: "Gani", session: "오전", profileImageURL: "", phone: "010-1111-2222", descriptions: ["진진가","진진가"]))
                }
            }
        }
    }
}

#Preview {
    LearnerCardView()
}
