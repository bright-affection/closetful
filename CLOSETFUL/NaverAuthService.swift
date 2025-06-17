//
//  NaverAuthService.swift
//  CLOSETFUL
//
//  Created by 김소정 on 6/17/25.
//
import Foundation

struct NaverAuthService {
    static let clientID = "너의_Client_ID"
    static let clientSecret = "너의_Client_Secret"
    static let redirectURI = "closetful://naver-login"

    // 1단계: Access Token 요청
    static func requestAccessToken(with code: String, completion: @escaping (String?) -> Void) {
        let url = URL(string: "https://nid.naver.com/oauth2.0/token")!

        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
        components.queryItems = [
            URLQueryItem(name: "grant_type", value: "authorization_code"),
            URLQueryItem(name: "client_id", value: clientID),
            URLQueryItem(name: "client_secret", value: clientSecret),
            URLQueryItem(name: "code", value: code),
            URLQueryItem(name: "redirect_uri", value: redirectURI)
        ]

        var request = URLRequest(url: components.url!)
        request.httpMethod = "POST"

        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                print("❌ 네이버 토큰 요청 실패:", error?.localizedDescription ?? "알 수 없음")
                completion(nil)
                return
            }

            do {
                if let json = try JSONSerialization.jsonObject(with: data) as? [String: Any],
                   let accessToken = json["access_token"] as? String {
                    completion(accessToken)
                } else {
                    completion(nil)
                }
            } catch {
                print("❌ JSON 파싱 실패:", error)
                completion(nil)
            }
        }

        task.resume()
    }

    // 2단계: 사용자 정보 요청
    static func requestUserInfo(token: String, completion: @escaping ([String: Any]?) -> Void) {
        let url = URL(string: "https://openapi.naver.com/v1/nid/me")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }

            do {
                if let json = try JSONSerialization.jsonObject(with: data) as? [String: Any],
                   let response = json["response"] as? [String: Any] {
                    completion(response)
                } else {
                    completion(nil)
                }
            } catch {
                completion(nil)
            }
        }

        task.resume()
    }
}
