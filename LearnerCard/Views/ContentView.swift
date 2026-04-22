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
        ZStack {
            TabView {
                Tab("러너카드", systemImage: "person.text.rectangle.fill") {
                    NavigationStack {
                        ZStack {
                            Color("BackgroundGray")
                                .ignoresSafeArea()
                            LearnerCardView(myCards: myCards)
                        }
                    }
                }
                
                Tab("프로필", systemImage: "person.fill") {
                    NavigationStack {
                        ZStack {
                            Color("BackgroundGray")
                                .ignoresSafeArea()
                            ProfileCardView2()
                        }
                    }
                }
                
                Tab(role: .search) {
                    NavigationStack {
                        ZStack {
                            Color("BackgroundGray")
                                .ignoresSafeArea()
                            LearnerCardView(searchText: searchText, myCards: myCards)
                        }
                        .searchable(text: $searchText, prompt: "러너 검색")
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
