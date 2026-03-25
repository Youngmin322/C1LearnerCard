//
//  ProfileCardView.swift
//  LearnerCard
//
//  Created by Youngmin Cho on 3/24/26.
//

import SwiftUI

struct ProfileCardView: View {
    var searchText: String = ""
    @State var isEditing = true
    @State var name = ""
    @State var nickName = ""
    @State var phoneNumber = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                CardUI(learnerCard: cardData(name: "ㅇㅇ", nickName: "ㅇㅇ", session: "ㅇㅇ", profileImageURL: "ㅇㅇ", phone: "ㅇㅇ", descriptions: ["ㅇㅇ"]))
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    
                    Button(action: { isEditing = true }) {
                        Image(systemName: "pencil")
                    }
                }
            }
            .navigationTitle("내 카드")
            .sheet(isPresented: $isEditing) {
                VStack(alignment: .leading, spacing: 4) {
                    Text("카드 세부 사항")
                        .font(.title2)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text("카드 정보를 확인하고\n작성을 완료하세요.")
                        .foregroundColor(.gray)
                        .font(.title2)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.horizontal)
                VStack(spacing: 0) {
                    HStack(alignment: .center, spacing: 30) {
                        Text("이름")
                            .frame(width: 60, alignment: .leading)
                        
                        TextField("필수 사항", text: $name)
                    }
                    
                    Divider()
                        .padding(.horizontal, -6)
                        .padding(10)
                    
                    HStack(alignment: .center, spacing: 30) {
                        Text("닉네임")
                            .frame(width: 60, alignment: .leading)
                        
                        TextField("필수 사항", text: $nickName)
                    }
                }
                .padding()
                .background(Color(uiColor: .secondarySystemBackground))
                .cornerRadius(20)
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    ProfileCardView()
}
