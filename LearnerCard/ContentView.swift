//
//  ContentView.swift
//  LearnerCard
//
//  Created by Youngmin Cho on 3/20/26.
//

import SwiftUI

let card: [cardData] = [
    cardData(name: "조영민",
             nickName: "Owen",
             session: "오전",
             phone: "010-9659-9798",
             descriptions: ["진진가1", "진진가2", "진진가3"]),
    cardData(name: "존",
             nickName: "러너",
             session: "오후",
             phone: "010-1111-2222",
             descriptions: ["진진진"]),
    
    cardData(name: "가니",
             nickName: "러너",
             session: "오후",
             phone: "010-1111-2222",
             descriptions: ["진진진"]),
    
    cardData(name: "매버릭",
             nickName: "러너",
             session: "오후",
             phone: "010-1111-2222",
             descriptions: ["진진진"]),
    
    cardData(name: "샨",
             nickName: "러너",
             session: "오후",
             phone: "010-1111-2222",
             descriptions: ["진진진"])
]

struct ContentView: View {
    
    @State var selectedIndex: Int? = nil
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ZStack {
                    ForEach(Array(card.enumerated()), id:\.element.id) { index, item in
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
        }
    }
}

#Preview {
    ContentView()
}
