//
//  NameEditView.swift
//  LearnerCard
//
//  Created by Youngmin Cho on 4/22/26.
//

import SwiftUI

struct NameEditView: View {
    var card: Card
    @State private var nameText = ""
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(spacing: 20) {
            Text("이름 수정")
                .font(.title2)
                .bold()
            
            TextField("이름 입력", text: $nameText)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
            
            Button {
                if !nameText.isEmpty {
                    card.name = nameText
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
        .onAppear {
            nameText = card.name
        }
    }
}
