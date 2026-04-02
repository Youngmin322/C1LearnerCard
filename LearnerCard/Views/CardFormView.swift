//
//  CardFormView.swift
//  LearnerCard
//
//  Created by Youngmin Cho on 3/28/26.
//

import SwiftUI
import SwiftData

struct CardFormView: View {
    
    @Binding var isEditing: Bool
    @State private var name = ""
    @State private var nickName = ""
    @State private var phoneNumber = ""
    @State private var session = "오전"
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(alignment: .center, spacing: 30) {
                Text("이름")
                    .bold()
                    .frame(width: 60, alignment: .leading)
                
                TextField("필수 사항", text: $name)
            }
            
            Divider()
                .padding(.horizontal, -6)
                .padding(10)
            
            HStack(alignment: .center, spacing: 30) {
                Text("닉네임")
                    .bold()
                    .frame(width: 60, alignment: .leading)
                
                TextField("", text: $nickName, prompt: Text("필수 사항").fontWeight(.regular))
                    .bold()
            }
            
            Divider()
                .padding(.horizontal, -6)
                .padding(10)
            
            HStack(alignment: .center, spacing: 30) {
                Text("세션")
                    .bold()
                    .frame(width: 60, alignment: .leading)
                
                Picker("", selection: $session) {
                    Text("오전").tag("오전")
                    Text("오후").tag("오후")
                }
                .pickerStyle(.menu)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .padding()
        .background(Color(uiColor: .secondarySystemBackground))
        .cornerRadius(20)
        .padding(.horizontal)
        
        Text("사용자의 이름, 닉네임은  Apple Developer Academy @ POSTECH\n러너 카드를 추가하는 데 사용됩니다. 이 정보는 암호화는 안 되고 그냥 저장되며, 저는 지금 졸립니다.")
            .font(.caption)
            .foregroundStyle(.gray)
            .padding(.horizontal)
        
        Spacer()
        
        NavigationLink(destination: CardEditView(isEditing: $isEditing, name: name, nickName: nickName, session: session)) {
            Text("계속")
                .font(.body)
                .bold()
                .frame(maxWidth: .infinity, maxHeight: 30)
        }
        .buttonStyle(.borderedProminent)
        .tint(name.isEmpty || nickName.isEmpty ? .gray : .blue)
        .disabled(name.isEmpty || nickName.isEmpty)
        .padding(.horizontal, 40)
    }
}


