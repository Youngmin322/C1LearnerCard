//
//  ContentView.swift
//  LearnerCard
//
//  Created by Youngmin Cho on 3/20/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    ForEach(card, id: \.name) { card in
                        CardUI()
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
