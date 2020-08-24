import UIKit

class BalanceView: UIView {
    let pointsLabel = UILabel()
    let starView = makeSymbolImageView(systemName: "star.fill")
    let starBalanceLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        style()
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    private func style(){
        [pointsLabel, starView, starBalanceLabel].forEach { (component) in
            component.translatesAutoresizingMaskIntoConstraints = false
        }

        pointsLabel.font = .boldSystemFont(ofSize: 35)
        pointsLabel.text = "12"

        starView.tintColor = .starYellow
        starView.contentMode = .scaleAspectFit

        starBalanceLabel.font = .preferredFont(forTextStyle: .footnote)
        starBalanceLabel.textColor = .label
        starBalanceLabel.text = "Star balance"
    }
    private func layout(){
        [pointsLabel, starView, starBalanceLabel].forEach { (component) in
            addSubview(component)
        }

        NSLayoutConstraint.activate([
            pointsLabel.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 0),
            pointsLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 0),
            starView.leadingAnchor.constraint(equalTo: pointsLabel.trailingAnchor, constant: -2),
            starView.centerYAnchor.constraint(equalTo: pointsLabel.centerYAnchor, constant: 4),
            starView.heightAnchor.constraint(equalToConstant: 15),

            starBalanceLabel.topAnchor.constraint(equalToSystemSpacingBelow: pointsLabel.bottomAnchor, multiplier: 0),
            starBalanceLabel.leadingAnchor.constraint(equalTo: pointsLabel.leadingAnchor),
            starBalanceLabel.trailingAnchor.constraint(equalToSystemSpacingAfter: trailingAnchor, multiplier: 0),
            starBalanceLabel.bottomAnchor.constraint(equalToSystemSpacingBelow: bottomAnchor, multiplier: 0),
        ])
    }
}
