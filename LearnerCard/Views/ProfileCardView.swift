//
//  ProfileCardView.swift
//  LearnerCard
//e
//  Created by Youngmin Cho on 3/24/26.
//

import SwiftUI

struct ProfileCardView: View {
    var searchText: String = ""
    @State var isEditing = false
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
            
            Spacer()
            
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
                        }
                        .padding()
                        .background(Color(uiColor: .secondarySystemBackground))
                        .cornerRadius(20)
                        .padding(.horizontal)
                        
                        Text("사용자의 이름, 닉네임은 Apple Developer Academy @ POSTECH\n러너 카드를 추가하는 데 사용됩니다. 이 정보는 암호화는 안 되고 그냥 저장되며, 사용자의 모든 기기에서 사용할 수 없습니다.")
                            .font(.caption)
                            .foregroundStyle(.gray)
                            .padding(.horizontal)
                        
                        Spacer()
                        
                        NavigationLink(destination: CardEditView()) {
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
        }
    }
}

#Preview {
    ContentView()
}
