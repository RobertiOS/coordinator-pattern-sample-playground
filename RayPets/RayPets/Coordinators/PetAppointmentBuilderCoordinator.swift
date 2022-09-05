final class PetAppointmentBuilderCoordinator: Coordinator {
  
  let builder = PetAppointmentBuilder()
  var children: [Coordinator] = []
  var router: Router
  
  public init(router: Router) {
    self.router = router
  }
  
  func present(animated: Bool, onDismissed: (() -> Void)?) {
    let viewController = SelectVisitTypeViewController.instantiate(delegate: self)
    router.present(viewController, animated: animated, onDismissed: onDismissed)
  }
  
}

extension PetAppointmentBuilderCoordinator: SelectVisitTypeViewControllerDelegate {
  func selectVisitTypeViewController(_ controller: SelectVisitTypeViewController, didSelect visitType: VisitType) {
    builder.visitType = visitType
    
    switch visitType {
    case .sick:
      presentSelectPainLevelCoordinator()
    case .well:
      presentNoAppointmentViewController()
    }
  }
  
  private func presentNoAppointmentViewController() {
      let viewController =
        NoAppointmentRequiredViewController.instantiate(
          delegate: self)
      router.present(viewController, animated: true)
    }

    private func presentSelectPainLevelCoordinator() {
      let viewController =
        SelectPainLevelViewController.instantiate(delegate: self)
      router.present(viewController, animated: true)
    }
}

// MARK: - SelectPainLevelViewControllerDelegate
extension PetAppointmentBuilderCoordinator:
  SelectPainLevelViewControllerDelegate {

  public func selectPainLevelViewController(
    _ controller: SelectPainLevelViewController,
    didSelect painLevel: PainLevel) {

    // 1
    builder.painLevel = painLevel

    // 2
    switch painLevel {

    // 3
    case .none, .little:
      presentFakingItViewController()

    // 4
    case .moderate, .severe, .worstPossible:
      presentNoAppointmentViewController()
    }
  }

  private func presentFakingItViewController() {
    let viewController =
      FakingItViewController.instantiate(delegate: self)
    router.present(viewController, animated: true)
  }
}

// MARK: - FakingItViewControllerDelegate
extension PetAppointmentBuilderCoordinator:
  FakingItViewControllerDelegate {

  public func fakingItViewControllerPressedIsFake(
    _ controller: FakingItViewController) {
    router.dismiss(animated: true)
  }

  public func fakingItViewControllerPressedNotFake(
    _ controller: FakingItViewController) {
    presentNoAppointmentViewController()
  }
}

// MARK: - NoAppointmentRequiredViewControllerDelegate
extension PetAppointmentBuilderCoordinator:
  NoAppointmentRequiredViewControllerDelegate {

  public func noAppointmentViewControllerDidPressOkay(
    _ controller: NoAppointmentRequiredViewController) {
    router.dismiss(animated: true)
  }
}


