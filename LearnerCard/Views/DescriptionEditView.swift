import SwiftUI

struct DescriptionEditView: View {
    var card: Card
    @State private var descriptionText = ""
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(spacing: 20) {
            Text("관심 기술 및 관심 분야")
                .font(.title2)
                .bold()
            
            TextField("관심 분야를 입력하세요", text: $descriptionText)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
            
            Button {
                card.descriptions = descriptionText.isEmpty ? [] : [descriptionText]
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
            descriptionText = card.descriptions.first ?? ""
        }
    }
}
