//
//  SceneDelegate1.swift
//  Marvel Code Case
//
//  Created by Dogukaan Kılıçarslan on 18.07.2022.
//

import UIKit
import CoreSpotlight

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }


        self.window = UIWindow(windowScene: windowScene)
        let mainView = SplashViewBuilder.build {
            self.initializeMainView()
        }

        SpotlightManager.configureSearchableItems()

        window?.rootViewController = mainView
        window?.makeKeyAndVisible()
    }

    func scene(_ scene: UIScene, continue userActivity: NSUserActivity) {
        if userActivity.activityType == CSSearchableItemActionType {
            if let uid = userActivity.userInfo?[CSSearchableItemActivityIdentifier] as? String {
                debugPrint("indexed item id: \(uid)")
            }
        }
    }
}
