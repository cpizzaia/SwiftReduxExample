//
//  AppDelegate.swift
//  ReduxExample
//
//  Created by Cody Pizzaia on 3/26/22.
//

import UIKit

class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    self.window = .init(
      frame: .init(
        x: 0,
        y: 0,
        width: UIScreen.main.bounds.width,
        height: UIScreen.main.bounds.height
      )
    )

    window?.makeKeyAndVisible()
    window?.rootViewController = ViewController()
    return true
  }
}

