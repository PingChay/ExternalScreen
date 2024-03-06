//
//  ExternalSceneDelegate.swift
//  MultiScreen
//
//  Created by Saran Nonkamjan on 6/3/2567 BE.
//

import UIKit
import SwiftUI

final class ExternalSceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let scene = scene as? UIWindowScene else {
            return
        }
        
        let content = ExternalView()
        window = UIWindow(windowScene: scene)
        window?.rootViewController = UIHostingController(rootView: content)
        window?.isHidden = false
    }
}
