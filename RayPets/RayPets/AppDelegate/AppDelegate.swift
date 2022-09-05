/// Copyright (c) 2019 Razeware LLC
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy

import UIKit

@UIApplicationMain
public class AppDelegate: UIResponder, UIApplicationDelegate {

  // MARK: - Instance Properties
  public lazy var window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)
   lazy var router = AppDelegateRouter(window: window!)
   lazy var homeCoordinator = HomeCoordinator(router: router)

  // MARK: - Application Lifecycle
  public func application(_ application: UIApplication,
                          didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    homeCoordinator.present(animated: true, onDismissed: nil)
    return true
  }
}
