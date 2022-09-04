
import UIKit

public class NavigationRouter: NSObject {

  private let navigationController: UINavigationController
  private let routerRootController: UIViewController?
  private var onDismissForViewController:
    [UIViewController: (() -> Void)] = [:]

  public init(navigationController: UINavigationController) {
    self.navigationController = navigationController
    self.routerRootController =
      navigationController.viewControllers.first
    super.init()
  }
}
