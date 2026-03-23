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
    cardData(name: "김애플",
             nickName: "러너",
             session: "오후",
             phone: "010-1111-2222",
             descriptions: ["진진진"])
]

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    ForEach(card) { item in
                        CardUI(learnerCard: item)
                    }
                }
                .navigationTitle("러너 카드")
            }
        }
    }
}

#Preview {
    ContentView()
}
