//
//  ContentView.swift
//  LearnerCard
//
//  Created by Youngmin Cho on 3/24/26.
//

import SwiftUI

struct ContentView: View {
    @State private var searchText = ""
    
    var body: some View {
        TabView {
            Tab("러너", systemImage: "person.fill") {
                NavigationStack {
                    LearnerCardView()
                }
            }
            
            Tab("카드", systemImage: "person.text.rectangle.fill") {
                NavigationStack {
                    ProfileCardView()
                }
            }
            
            Tab(role: .search) {
                NavigationStack {
                    LearnerCardView(searchText: searchText)
                }
                .searchable(text: $searchText, prompt: "러너 검색")
            }
        }
    }
}

#Preview {
    ContentView()
}
