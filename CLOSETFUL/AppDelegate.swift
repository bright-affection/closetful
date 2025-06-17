//
//  AppDelegate.swift
//  CLOSETFUL
//
//  Created by 김소정 on 6/17/25.
//
import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {

    func applicationDidFinishLaunching(_ notification: Notification) {
        // 초기 설정 (필요 시 추가)
    }

    func application(_ application: NSApplication,
                     open urls: [URL]) {
        guard let url = urls.first else { return }

        if url.scheme == "closetful",
           url.host == "naver-login",
           let components = URLComponents(url: url, resolvingAgainstBaseURL: false),
           let code = components.queryItems?.first(where: { $0.name == "code" })?.value {

            print("✅ 인증 코드 수신: \(code)")

            NaverAuthService.requestAccessToken(with: code) { token in
                if let token = token {
                    print("✅ 네이버 로그인 성공! Access Token: \(token)")

                    // ➡️ 사용자 정보 가져오기
                    NaverAuthService.requestUserInfo(token: token) { profile in
                        if let profile = profile {
                            print("👤 사용자 정보:", profile)
                        } else {
                            print("❌ 사용자 정보 불러오기 실패")
                        }
                    }
                }
            }
        }
    }
}


