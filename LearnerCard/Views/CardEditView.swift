//
//  CardEditView.swift
//  LearnerCard
//
//  Created by Youngmin Cho on 3/27/26.
//

import SwiftUI

struct CardEditView: View {
    @Environment(\.dismiss) var dismiss
    @State var descriptions = ""
    @State var session = ""
    @Binding var isEditing: Bool
    
    var body: some View {
        VStack(alignment: .trailing) {
            Text("카드 세부 사항")
                .font(.title)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("카드 정보를 확인하고\n작성을 완료하세요.")
                .foregroundColor(.gray)
                .font(.title2)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            TextEditor(text: $descriptions)
                .frame(height: 100)
                .scrollContentBackground(.hidden)
                .background(Color.gray.opacity(0.15))
                .clipShape(RoundedRectangle(cornerRadius: 8))
            
            Spacer()
            
            Button {
                isEditing = false
            } label: {
                Text("완료")
                    .font(.body)
                    .bold()
                    .frame(maxWidth: .infinity, maxHeight: 30)
            }
            .buttonStyle(.borderedProminent)
            .padding(.horizontal, 40)
            
        }
        .padding(.horizontal)
    
    }
}

