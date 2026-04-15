//
//  Card​Exchange​View.swift
//  LearnerCard
//
//  Created by Youngmin Cho on 3/30/26.
//

import SwiftUI
import SwiftData
import MultipeerConnectivity
import Combine

struct CardExchangeView: View {
    @Environment(\.modelContext) private var modelContext
    var myCard: Card
    @State private var viewModel: CardExchangeViewModel
    
    init(myCard: Card) {
        self.myCard = myCard
        _viewModel = State(initialValue: CardExchangeViewModel(myCard: myCard))
    }
    
    var body: some View {
        Group {
            if viewModel.isConnected {
                VStack {
                    Image(systemName: "person.crop.circle.badge.checkmark.fill")
                    Text("\(viewModel.yourName)과 연결되었습니다.")
                    Text("\(String(format: "%.1f", viewModel.nearDistance ?? 0))m 떨어져 있음")
                    Button("교환") {
                        viewModel.connectionService?.sendCard(myCard)
                    }
                }
            } else {
                VStack(spacing: 16) {
                    Image(systemName: "antenna.radiowaves.left.and.right")
                        .font(.system(size: 60))
                        .foregroundStyle(.blue)
                        .scaleEffect(1.0 + sin(Double(viewModel.dotCount) * 0.5) * 0.1)
                        .animation(.easeInOut(duration: 0.5), value: viewModel.dotCount)
                        .padding()
                    
                    Text("주변 러너를 검색 중\(String(repeating: ".", count: viewModel.dotCount))")
                        .font(.custom("Pretendard-SemiBold", size: 20))
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                    
                    Text("같은 화면에 있는 친구를 찾고 있어요")
                        .font(.custom("Pretendard-Regular", size: 14))
                        .foregroundColor(.black.opacity(0.7))
                        .multilineTextAlignment(.center)
                    
                    Button("검색 재시작") {
                        
                    }
                    .padding(.top, 16)
                    .font(.custom("Pretendard-Medium", size: 17))
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .contentShape(Rectangle())
                .onReceive(viewModel.dotTimer) { _ in
                    viewModel.dotCount = (viewModel.dotCount + 1) % 4
                }
            }
        }
        .onAppear {
            viewModel = CardExchangeViewModel(myCard: myCard)
            viewModel.modelContext = modelContext
            
            let nearby = Nearbysession()
            viewModel.NearbySession = nearby
            let service = ConnectionService(displayName: myCard.nickName)
            service.onPeerConnected = { card in
                DispatchQueue.main.async {
                    viewModel.isConnected = true
                    viewModel.yourName = card
                }
                if let myToken = nearby.myToken {
                    service.sendToken(myToken)
                }
            }
            service.onCardReceived = { card in
                DispatchQueue.main.async {
                    modelContext.insert(card)
                }
            }
            service.startService()
            viewModel.connectionService = service
            
            nearby.onDistanceUpdated = { distance in
                DispatchQueue.main.async {
                    viewModel.nearDistance = distance
                }
            }
            
            service.onTokenReceived = { token in
                nearby.start(peerToken: token)
            }
        }
    }
}
