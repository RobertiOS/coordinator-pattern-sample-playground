import UIKit

// MARK: - StepViewControllerDelegate
public protocol StepViewControllerDelegate: class {
  func stepViewControllerDidPressNext(_ controller: StepViewController)
}

// MARK: - StepViewController
public class StepViewController: UIViewController {
  
  // MARK: - Instance Properties
  public var delegate: StepViewControllerDelegate?
  
  private var buttonColor: UIColor!
  private var text: String!
  
  // MARK: - Views
  private var button: UIButton!
  private var label: UILabel!
  
  // MARK: - View Lifecycle
  public override func loadView() {
    setupView()
    setupButton()
  }
  
  private func setupView() {
    view = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 480))
    view.backgroundColor = .white
  }
  
  private func setupButton() {
    button = UIButton()
    view.addSubview(button)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    button.heightAnchor.constraint(greaterThanOrEqualToConstant: 100).isActive = true
    button.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
    
    button.setTitle(text, for: .normal)
    button.titleLabel?.numberOfLines = 0
    button.titleLabel?.lineBreakMode = .byWordWrapping
    button.backgroundColor = buttonColor
    button.addTarget(self, action: #selector(nextButtonPressed(_:)), for: .touchUpInside)
  }
  
  @objc private func nextButtonPressed(_ sender: AnyObject) {
    delegate?.stepViewControllerDidPressNext(self)
  }
}

// MARK: - Constructors
extension StepViewController {
  
  public class func instantiate(delegate: StepViewControllerDelegate?,
                                buttonColor: UIColor,
                                text: String,
                                title: String) -> StepViewController {
    let viewController = StepViewController()
    viewController.delegate = delegate
    viewController.buttonColor = buttonColor
    viewController.text = text
    viewController.title = title
    return viewController
  }
}
