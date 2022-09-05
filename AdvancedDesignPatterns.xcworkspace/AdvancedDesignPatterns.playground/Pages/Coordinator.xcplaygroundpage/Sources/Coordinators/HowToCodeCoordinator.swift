import UIKit

public class HowToCodeCoordinator: Coordinator {
    
    public init(router: Router) {
        self.router = router
    }
    
    lazy private var startOverViewController = StartOverViewController.instantiate(delegate: self)
    
    public var children = [Coordinator]()
    
    public var router: Router
    
    private lazy var stepViewControllers = [
        StepViewController.instantiate(
            delegate: self,
            buttonColor: UIColor(red: 0.96, green: 0, blue: 0.11,
                                 alpha: 1),
            text: "When I wake up, well, I'm sure I'm gonna be\n\n" +
            "I'm gonna be the one writin' code for you",
            title: "I wake up"),
        
        StepViewController.instantiate(
            delegate: self,
            buttonColor: UIColor(red: 0.93, green: 0.51, blue: 0.07,
                                 alpha: 1),
            text: "When I go out, well, I'm sure I'm gonna be\n\n" +
            "I'm gonna be the one thinkin' bout code for you",
            title: "I go out"),
        
        StepViewController.instantiate(
            delegate: self,
            buttonColor: UIColor(red: 0.23, green: 0.72, blue: 0.11,
                                 alpha: 1),
            text: "Cause' I would code five hundred lines\n\n" +
            "And I would code five hundred more",
            title: "500 lines"),
        
        StepViewController.instantiate(
            delegate: self,
            buttonColor: UIColor(red: 0.18, green: 0.29, blue: 0.80,
                                 alpha: 1),
            text: "To be the one that wrote a thousand lines\n\n" +
            "To get this code shipped out the door!",
            title: "Ship it!")
    ]
    
    public func present(animated: Bool, onDismissed: (() -> Void)?) {
        let viewController = stepViewControllers.first!
        router.present(viewController, animated: true)
    }
    
}

extension HowToCodeCoordinator: StepViewControllerDelegate {
    public func stepViewControllerDidPressNext(_ controller: StepViewController) {
        if let viewController =
            stepViewController(after: controller) {
            router.present(viewController, animated: true)
        } else {
            router.present(startOverViewController, animated: true)
        }
    }
    
    private func stepViewController(after controller: StepViewController) -> StepViewController? {
        guard let index = stepViewControllers.firstIndex(of: controller),
              let last = stepViewControllers.indices.last,
              index < last  else { return nil }
        return stepViewControllers[index + 1]
    }
}

extension HowToCodeCoordinator: StartOverViewControllerDelegate {
    public func startOverViewControllerDidPressStartOver(_ controller: StartOverViewController) {
        print("start over")
        router.dismiss(animated: true)
    }
}
