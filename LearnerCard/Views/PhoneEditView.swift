import SwiftUI

struct PhoneEditView: View {
    var card: Card
    @State private var phoneText = ""
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(spacing: 20) {
            Text("전화번호 수정")
                .font(.title2)
                .bold()
            
            TextField("전화번호 입력", text: $phoneText)
                .keyboardType(.numberPad)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
                .onChange(of: phoneText) { _, newValue in
                    phoneText = formatPhoneNumber(newValue)
                }
            
            Button {
                card.phone = phoneText.isEmpty ? nil : phoneText
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
            phoneText = card.phone ?? ""
        }
    }
    
    private func formatPhoneNumber(_ number: String) -> String {
        let clean = number.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        let mask = "XXX-XXXX-XXXX"
        var result = ""
        var index = clean.startIndex
        for char in mask {
            if index == clean.endIndex { break }
            if char == "X" {
                result.append(clean[index])
                index = clean.index(after: index)
            } else {
                result.append(char)
            }
        }
        return result
    }
}
