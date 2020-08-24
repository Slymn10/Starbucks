import UIKit

func makeGreenButton(withText text: String)->UIButton{
      let button = UIButton()
      button.translatesAutoresizingMaskIntoConstraints = false
      button.setTitle(text, for: .normal)
      //button.titleLabel?.adjustsFontSizeToFitWidth = true
      button.contentEdgeInsets = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
      button.backgroundColor = .darkGreen
      button.layer.cornerRadius = 18
      return button
}
func makeSymbolImageView(systemName: String, scale: UIImage.SymbolScale = .large) -> UIImageView {
    let configuration = UIImage.SymbolConfiguration(scale: scale)
    let image = UIImage(systemName: systemName, withConfiguration: configuration)

    return UIImageView(image: image)
}
func makeClearButton(withText text: String) -> UIButton {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle(text, for: .normal)
    button.titleLabel?.adjustsFontSizeToFitWidth = true
    button.contentEdgeInsets = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
    button.layer.cornerRadius = 40/2
    button.layer.borderWidth = 0.5

    button.setTitleColor(.label, for: .normal)
    button.layer.borderColor = UIColor.label.cgColor
    button.backgroundColor = .systemBackground

    return button
}
public extension NSLayoutConstraint {
    @objc func setActiveBreakable(priority: UILayoutPriority = UILayoutPriority(900)) {
        self.priority = priority
        isActive = true
    }
}
