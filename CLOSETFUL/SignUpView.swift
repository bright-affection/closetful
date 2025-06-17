import SwiftUI

struct SignUpView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()

            VStack {
                // 돌아가기 버튼
                HStack {
                    Button(action: {
                        dismiss()
                    }) {
                        HStack(spacing: 4) {
                            Image(systemName: "chevron.left")
                            Text("돌아가기")
                        }
                        .font(.system(size: 13))
                        .foregroundColor(.black)
                    }
                    .buttonStyle(PlainButtonStyle())

                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top)

                Spacer()

                // 상단 앱 이름 + 슬로건
                VStack(spacing: 8) {
                    Text("Closetful")
                        .font(.system(size: 28, weight: .semibold))
                        .foregroundColor(.black)

                    Text("당신의 옷장을 가득 채운 스타일")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                }
                .padding(.bottom, 16)

                Image(systemName: "hanger")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 70, height: 70) // ✅ 작게
                    .foregroundColor(.black.opacity(0.8))
                    .padding(.bottom, 24)

                // 버튼들
                VStack(spacing: 12) {
                    Button("네이버로 로그인") {
                        NaverLoginManager.login()
                    }
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, minHeight: 44)
                    .background(Color.green)
                    .cornerRadius(10)
                    .buttonStyle(PlainButtonStyle())

                    Button("카카오톡으로 로그인") {
                        // TODO
                    }
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, minHeight: 44)
                    .background(Color.yellow)
                    .cornerRadius(10)
                    .buttonStyle(PlainButtonStyle())

                    Button("이메일로 회원가입하기") {
                        // TODO
                    }
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, minHeight: 44)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 1)
                    )
                    .buttonStyle(PlainButtonStyle())
                }
                .frame(maxWidth: 280)

                Spacer()
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}
