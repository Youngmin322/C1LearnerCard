//
//  ContentView.swift
//  LearnerCard Watch Watch App
//
//  Created by Youngmin Cho on 4/14/26.
//

import SwiftUI
import WatchConnectivity

struct ContentView: View {
    @State private var cardService = CardDataService.shared

    var body: some View {
        VStack {
            if let card = cardService.cardDTO {
                Text(card.nickName)
                Text(card.name)
            } else {
                Text("받은 카드 없음")
                    .foregroundStyle(.gray)
            }
        }
    }
}

#Preview {
    ContentView()
}
