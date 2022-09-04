import UIKit

// MARK: - StartOverViewControllerDelegate
public protocol StartOverViewControllerDelegate: class {
  func startOverViewControllerDidPressStartOver(_ controller: StartOverViewController)
}

// MARK: - StartOverViewController
public class StartOverViewController: UIViewController {
  
  // MARK: - Instance Properties
  public var delegate: StartOverViewControllerDelegate?
  
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
    button.heightAnchor.constraint(equalToConstant: 100).isActive = true
    button.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
    
    button.setTitle("START OVER", for: .normal)
    button.backgroundColor = .black
    button.addTarget(self, action: #selector(startButtonPressed(_:)), for: .touchUpInside)
  }
  
  @objc private func startButtonPressed(_ sender: AnyObject) {
    delegate?.startOverViewControllerDidPressStartOver(self)
  }
}

// MARK: - Constructors
extension StartOverViewController {
  
  public class func instantiate(delegate: StartOverViewControllerDelegate?) -> StartOverViewController {
    let viewController = StartOverViewController()
    viewController.delegate = delegate
    viewController.title = "Start Over?"
    return viewController
  }
}
