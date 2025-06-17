//
//  NaverLoginManager.swift
//  CLOSETFUL
//
//  Created by 김소정 on 6/17/25.
//
import Foundation
import AppKit

struct NaverLoginManager {
    static let clientID = "너의_Client_ID"
    static let redirectURI = "closetful://naver-login"

    static func login() {
        let state = UUID().uuidString
        let urlStr = """
        https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=\(clientID)&redirect_uri=\(redirectURI)&state=\(state)
        """

        if let url = URL(string: urlStr) {
            NSWorkspace.shared.open(url)
        }
    }
}

