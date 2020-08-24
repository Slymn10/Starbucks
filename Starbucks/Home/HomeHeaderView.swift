import UIKit

class HomeHeaderView:UIView{
    let greeting = UILabel()
    let inboxButton = UIButton()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        style()
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}

//MARK: - Style & Layout
extension HomeHeaderView{
    private func style(){
        greeting.translatesAutoresizingMaskIntoConstraints = false
        greeting.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        greeting.text = "Good afternoon, Suleyman ☀️"
        greeting.numberOfLines = 0
        greeting.lineBreakMode = .byWordWrapping

        makeInboxButton()

    }
    private func layout(){
        addSubview(greeting)
        addSubview(inboxButton)
        NSLayoutConstraint.activate([
            greeting.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            greeting.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            greeting.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            trailingAnchor.constraint(equalToSystemSpacingAfter: greeting.trailingAnchor, multiplier: 1),
            inboxButton.topAnchor.constraint(equalToSystemSpacingBelow: greeting.bottomAnchor, multiplier: 2),
            inboxButton.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            inboxButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.25),
            bottomAnchor.constraint(equalToSystemSpacingBelow: inboxButton.bottomAnchor, multiplier: 1),


        ])
    }
}

//MARK: - makeInboxButton
extension HomeHeaderView{
    func makeInboxButton(){
        inboxButton.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(systemName: "envelope")
        inboxButton.setImage(image, for: .normal)
        inboxButton.imageView?.tintColor = .secondaryLabel
        inboxButton.imageView?.contentMode = .scaleAspectFit
        inboxButton.setTitle("Inbox", for: .normal)
        inboxButton.setTitleColor(.label, for: .normal)

        inboxButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 16)
    }
}

//MARK: - Colors
extension UIColor {
    static let starYellow = UIColor(red: 204/255, green: 153/255, blue: 51/255, alpha: 1)
    static let tileBrown = UIColor(red: 235/255, green: 235/255, blue: 228/255, alpha: 1)
    static let darkGreen = UIColor(red: 0/255, green: 133/255, blue: 67/255, alpha: 1)
    static let lightGreen = UIColor(red: 0/255, green: 171/255, blue: 90/255, alpha: 1)
    static let backgroundWhite = UIColor(red: 247/255, green: 247/255, blue: 247/255, alpha: 1)
}
