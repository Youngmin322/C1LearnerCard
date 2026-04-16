//
//  ContentView.swift
//  LearnerCard
//
//  Created by Youngmin Cho on 3/24/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var searchText = ""
    @Query(filter: #Predicate<Card> { $0.isMine == true })
    var myCards: [Card]
    
    var body: some View {
        TabView {
            Tab("러너", systemImage: "person.fill") {
                NavigationStack {
                    LearnerCardView(myCards: myCards)
                }
            }
            
            Tab("카드", systemImage: "person.text.rectangle.fill") {
                NavigationStack {
                    ProfileCardView()
                }
            }
            
            Tab(role: .search) {
                NavigationStack {
                    LearnerCardView(searchText: searchText, myCards: myCards)
                }
                .searchable(text: $searchText, prompt: "러너 검색")
            }
        }
    }
}

#Preview {
    ContentView()
}
