import UIKit

final class HomeCoordinator: Coordinator {
  
  // MARK: instance properties
  public var children: [Coordinator] = []
  public let router: Router
  
  public init(router: Router) {
    self.router = router
  }
  
  // MARK: instance methods
  
  func present(animated: Bool, onDismissed: (() -> Void)?) {
    let homeViewController = HomeViewController.instantiate(delegate: self)
    router.present(homeViewController, animated: animated)
  }
  
}

extension HomeCoordinator: HomeViewControllerDelegate {
  func homeViewControllerDidPressScheduleAppointment(_ viewController: HomeViewController) {
    let router =
      ModalNavigationRouter(parentViewController: viewController)
    let coordinator =
      PetAppointmentBuilderCoordinator(router: router)
    presentChild(coordinator, animated: true)
  }
}
