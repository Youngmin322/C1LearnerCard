//
//  SessionEditView.swift
//  LearnerCard
//
//  Created by Youngmin Cho on 4/22/26.
//

import SwiftUI

struct SessionEditView: View {
    var card: Card
    @State private var sessionText = ""
    @Environment(\.dismiss) private var dismiss
    
    init(card: Card) {
        self.card = card
        _sessionText = State(initialValue: card.session)
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Text("세션 수정")
                .font(.title2)
                .bold()
            
            List {
                Picker("세션", selection: $sessionText) {
                    Text("오전").tag("오전")
                    Text("오후").tag("오후")
                }
            }
            
            Button {
                if !sessionText.isEmpty {
                    card.session = sessionText
                }
                dismiss()
            } label: {
                Text("저장")
                    .bold()
                    .frame(maxWidth: .infinity, maxHeight: 30)
            }
            .buttonStyle(.borderedProminent)
            .padding(.horizontal, 40)
            
            Spacer()
        }
        .padding(.top, 30)
    }
}

