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
    @State private var dotCount: Int = 0
    @State private var dotTimer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    @State private var isConnected: Bool = false
    
    @State private var connectionService: ConnectionService?
    @Environment(\.modelContext) private var modelContext
    var myCard: Card
    
    @ViewBuilder
    var body: some View {
        if isConnected {
            VStack {
                Image(systemName: "person.crop.circle.badge.checkmark.fill")
                Text("연결 되었습니다.")
                Button("교환") {
                    connectionService?.sendCard(myCard)
                }
            }
        } else {
            VStack(spacing: 16) {
                Image(systemName: "antenna.radiowaves.left.and.right")
                    .font(.system(size: 60))
                    .foregroundStyle(.blue)
                    .scaleEffect(1.0 + sin(Double(dotCount) * 0.5) * 0.1)
                    .animation(.easeInOut(duration: 0.5), value: dotCount)
                    .padding()
                
                Text("주변 기기를 검색 중\(String(repeating: ".", count: dotCount))")
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
            .onReceive(dotTimer) { _ in
                dotCount = (dotCount + 1) % 4
            }
            .onAppear {
                let service = ConnectionService(displayName: myCard.nickName)
                service.onPeerConnected = {
                    DispatchQueue.main.async {
                        isConnected = true
                    }
                }
                service.onCardReceived = { card in
                    DispatchQueue.main.async {
                        modelContext.insert(card)
                    }
                }
                service.startService()
                connectionService = service
            }
        }
    }
}
