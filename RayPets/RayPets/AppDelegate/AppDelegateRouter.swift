
import UIKit

final class AppDelegateRouter: Router {
  
  // MARK: Instance properties
  
  public let window: UIWindow
  
  init(window: UIWindow) {
    self.window = window
  }
  
  // MARK: Router
  
  func present(_ viewController: UIViewController, animated: Bool, onDismissed: (() -> Void)?) {
    window.rootViewController = viewController
    window.makeKeyAndVisible()
  }
  
  func dismiss(animated: Bool) {
    // nothing
  }
  
  
}
