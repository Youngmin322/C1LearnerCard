//
//  ProfileCardView.swift
//  LearnerCard
//e
//  Created by Youngmin Cho on 3/24/26.
//

import SwiftUI
import SwiftData

struct ProfileCardView: View {
    @State private var isEditing = false
    @Query private var myCards: [Card]
    @State private var connectionService: ConnectionService?
    @State private var showAlert = false
    @State private var showExchange = false
    
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        VStack {
            if let myCard = myCards.first {
                Button {
                    showExchange = true
                } label: {
                    CardView(learnerCard: myCard)
                        .contentShape(Rectangle())
                }
                .buttonStyle(.plain)

                Spacer()
            } else {
                Text("아직 내 카드가 없어요! \n 카드를 만들어 보세요!")
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                
                Button(action: { isEditing = true }) {
                    if myCards.isEmpty {
                        Image(systemName: "plus")
                    } else {
                        Image(systemName: "pencil")
                    }
                }
            }
        }
        .navigationTitle("내 카드")
        .alert("교환", isPresented: $showAlert) {
            Button("교환") {
                if let myCard = myCards.first {
                    connectionService?.sendCard(myCard)
                }
            }
            Button("취소", role: .cancel) {
                
            }
        } message: {
             Text("카드를 교환할까요?")
        }
        .onAppear {
            if let myCard = myCards.first {
                let service = ConnectionService(displayName: myCard.nickName)
                service.onCardReceived = { card in
                    modelContext.insert(card)
                }
                service.startService()
                connectionService = service
            }
        }
        .onDisappear {
            connectionService?.stopServices()
        }
        .sheet(isPresented: $isEditing) {
            NavigationStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("카드 세부 사항")
                        .font(.title)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text("카드 정보를 확인하고\n작성을 완료하세요.")
                        .foregroundColor(.gray)
                        .font(.title2)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.horizontal)
                .padding(.top, 50)
                
                CardFormView( isEditing: $isEditing)
            }
        }
        .sheet(isPresented: $showExchange) {
            if myCards.first != nil {
                CardExchangeView()
                    .presentationDetents([.medium, .large])
            } else {
                Text("내 카드가 없어 교환을 시작할 수 없어요.")
                    .padding()
            }
        }
    }
}

#Preview {
    ProfileCardView()
        .modelContainer(for: Card.self, inMemory: true)
}

