////
////  ProfileCardView.swift
////  LearnerCard
////
////  Created by Youngmin Cho on 3/24/26.
////
//
//import SwiftUI
//import SwiftData
//
//struct ProfileCardView: View {
//    @State private var isEditing = false
//    @State private var showExchange = false
//    @Query(filter: #Predicate<Card> { $0.isMine == true })
//    private var myCards: [Card]
//    var existingCard: Card? = nil
//    
//    var body: some View {
//        VStack {
//            if let myCard = myCards.first {
//                Button {
//                    showExchange = true
//                } label: {
//                    CardView(learnerCard: myCard)
//                        .contentShape(Rectangle())
//                }
//                .buttonStyle(.plain)
//                
//                Spacer()
//            } else {
//                Text("아직 내 카드가 없어요! \n 카드를 만들어 보세요!")
//                    .foregroundColor(.gray)
//                    .multilineTextAlignment(.center)
//            }
//        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        
//        .toolbar {
//            ToolbarItem(placement: .topBarTrailing) {
//                
//                Button(action: { isEditing = true }) {
//                    if myCards.isEmpty {
//                        Image(systemName: "plus")
//                    } else {
//                        Image(systemName: "pencil")
//                    }
//                }
//            }
//        }
//        .navigationTitle("내 카드")
//        .sheet(isPresented: $isEditing) {
//            if myCards.isEmpty {
//                NavigationStack {
//                    CardFormView(isEditing: $isEditing)
//                }
//            } else {
//                NavigationStack {
//                    CardFormView(isEditing: $isEditing, existingCard: myCards.first)
//                }
//            }
//        }
//    }
//}
//
//#Preview {
//    ProfileCardView()
//        .modelContainer(for: Card.self, inMemory: true)
//}
