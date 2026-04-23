//
//  NickNameEditView.swift
//  LearnerCard
//
//  Created by Youngmin Cho on 4/22/26.
//

import SwiftUI

struct NickNameEditView: View {
    var card: Card
    @State private var nickNameText = ""
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(spacing: 20) {
            Text("닉네임 수정")
                .font(.title2)
                .bold()
            
            TextField("닉네임 입력", text: $nickNameText)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
            
            Button {
                if !card.nickName.isEmpty {
                    card.nickName = nickNameText
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
            nickNameText = card.nickName
        }
    }
}
