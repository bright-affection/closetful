import SwiftUI

struct HomeView: View {
    @State private var showLogin = false
    @State private var showSignUp = false
    @State private var appear = false

    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()

            VStack {
                Spacer()

                VStack(spacing: 32) {
                    // 타이틀 + 슬로건
                    VStack(spacing: 10) {
                        Text("Closetful")
                            .font(.system(size: 36, weight: .bold))
                            .foregroundColor(.black)
                            .opacity(appear ? 1 : 0)
                            .offset(y: appear ? 0 : -20)
                            .animation(.easeOut(duration: 0.6), value: appear)

                        Text("당신의 옷장을 가득 채운 스타일")
                            .font(.system(size: 16))
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                            .opacity(appear ? 1 : 0)
                            .offset(y: appear ? 0 : -20)
                            .animation(.easeOut(duration: 0.6).delay(0.1), value: appear)
                    }

                    // 아이콘
                    Image(systemName: "hanger")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.black.opacity(0.8))
                        .opacity(appear ? 1 : 0)
                        .offset(y: appear ? 0 : 20)
                        .animation(.easeOut(duration: 0.6).delay(0.2), value: appear)

                    // 버튼들
                    VStack(spacing: 16) {
                        Button(action: {
                            showLogin.toggle()
                        }) {
                            Text("로그인")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity, minHeight: 50)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color.black, lineWidth: 1)
                                )
                        }
                        .buttonStyle(PlainButtonStyle())
                        .contentShape(Rectangle())

                        Button(action: {
                            showSignUp.toggle()
                        }) {
                            Text("회원가입")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity, minHeight: 50)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color.black, lineWidth: 1)
                                )
                        }
                        .buttonStyle(PlainButtonStyle())
                        .contentShape(Rectangle())
                    }
                    .frame(maxWidth: 300)
                    .opacity(appear ? 1 : 0)
                    .offset(y: appear ? 0 : 30)
                    .animation(.easeOut(duration: 0.6).delay(0.3), value: appear)
                }

                Spacer()
            }
            .padding()
            .onAppear {
                withAnimation {
                    appear = true
                }
            }
        }

        // ✅ macOS에서는 .sheet 사용 + 시트 크기 지정
        .sheet(isPresented: $showSignUp) {
            SignUpView()
                .frame(minWidth: 600, minHeight: 500) // 시트 크기 키워서 버튼 보이게
        }

        // 로그인 시트도 나중에 확장 가능
        .sheet(isPresented: $showLogin) {
            LoginView()
                .frame(minWidth: 500, minHeight: 400)
        }
    }
}

