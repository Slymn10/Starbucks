import UIKit

class RewardsTileView: UIView {
    let balanceView = BalanceView()
    var rewardsButton = UIButton()
    let rewardsGraphView = RewardsGraphView()
    let starRewardsView = StarRewardsView()
    var detailsButton = UIButton()

    var heightConstraint: NSLayoutConstraint?
    override init(frame: CGRect) {
        super.init(frame: .zero)
        style()
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override var intrinsicContentSize: CGSize{
        return CGSize(width: 100, height: 300)
    }
}

extension RewardsTileView{
    private func style(){
        backgroundColor = .backgroundWhite
        [balanceView, rewardsGraphView, detailsButton, starRewardsView, rewardsButton].forEach { (component) in
            component.translatesAutoresizingMaskIntoConstraints = false
        }
        detailsButton = makeClearButton(withText: "Details")
        makeRewardsOptionButton()

    }
    private func makeRewardsOptionButton() {
        rewardsButton.translatesAutoresizingMaskIntoConstraints = false
        rewardsButton.addTarget(self, action: #selector(rewardOptionsTapped), for: .primaryActionTriggered)

        let configuration = UIImage.SymbolConfiguration(scale: .small)
        let image = UIImage(systemName: "chevron.down", withConfiguration: configuration)

        rewardsButton.setImage(image, for: .normal)
        rewardsButton.imageView?.tintColor = .label
        rewardsButton.imageView?.contentMode = .scaleAspectFit

        rewardsButton.setTitle("Rewards options", for: .normal)
        rewardsButton.setTitleColor(.label, for: .normal)
        rewardsButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: .footnote)

        rewardsButton.semanticContentAttribute = .forceRightToLeft
        rewardsButton.imageEdgeInsets = UIEdgeInsets(top: 2, left: 20, bottom: 0, right: 0)
        rewardsButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 20)
    }
    private func layout(){
        [balanceView, rewardsGraphView, detailsButton, starRewardsView, rewardsButton].forEach { (component) in
            addSubview(component)
        }
        heightConstraint = starRewardsView.heightAnchor.constraint(equalToConstant: 0)
        NSLayoutConstraint.activate([
            balanceView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 0),
            balanceView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),

            rewardsButton.centerYAnchor.constraint(equalTo: balanceView.pointsLabel.centerYAnchor),
            trailingAnchor.constraint(equalToSystemSpacingAfter: rewardsButton.trailingAnchor, multiplier: 3),
            rewardsGraphView.topAnchor.constraint(equalToSystemSpacingBelow: balanceView.bottomAnchor, multiplier: 1),
            rewardsGraphView.centerXAnchor.constraint(equalTo: centerXAnchor),
            rewardsGraphView.widthAnchor.constraint(equalToConstant: frame.width),
            rewardsGraphView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            trailingAnchor.constraint(equalToSystemSpacingAfter: rewardsGraphView.trailingAnchor, multiplier: 2),

            starRewardsView.topAnchor.constraint(equalToSystemSpacingBelow: rewardsGraphView.bottomAnchor, multiplier: 1),
            starRewardsView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: starRewardsView.trailingAnchor, multiplier: 1),
            heightConstraint!,


            detailsButton.topAnchor.constraint(equalToSystemSpacingBelow: starRewardsView.bottomAnchor, multiplier: 2),
            detailsButton.leadingAnchor.constraint(equalToSystemSpacingAfter: balanceView.leadingAnchor, multiplier: 0),
            bottomAnchor.constraint(equalToSystemSpacingBelow: detailsButton.bottomAnchor, multiplier: 2),



        ])
        starRewardsView.isHidden = true

    }

    override func layoutSubviews() {
        super.layoutSubviews()
        rewardsGraphView.actualFrameWidth = frame.width
        rewardsGraphView.drawRewardsGraph()
    }
}

// MARK: Actions
extension RewardsTileView {
    @objc func rewardOptionsTapped() {

        if heightConstraint?.constant == 0 {
            self.setChevronUp()

            let heightAnimator = UIViewPropertyAnimator(duration: 0.75, curve: .easeInOut) {
                self.heightConstraint?.constant = 270
                self.layoutIfNeeded()
            }
            heightAnimator.startAnimation()

            let alphaAnimator = UIViewPropertyAnimator(duration: 0.25, curve: .easeInOut) {
                self.starRewardsView.isHidden = false
                self.starRewardsView.alpha = 1
            }
            alphaAnimator.startAnimation(afterDelay: 0.5)

        } else {
            self.setChevronDown()

            let animator = UIViewPropertyAnimator(duration: 0.75, curve: .easeInOut) {
                self.heightConstraint?.constant = 0
                self.starRewardsView.isHidden = true
                self.starRewardsView.alpha = 0
                self.layoutIfNeeded()
            }
            animator.startAnimation()
        }
    }

    @objc func detailsButtonTapped() {
        print("Details tapped!!!")
    }

    private func setChevronUp() {
        let configuration = UIImage.SymbolConfiguration(scale: .small)
        let image = UIImage(systemName: "chevron.up", withConfiguration: configuration)
        rewardsButton.setImage(image, for: .normal)
    }

    private func setChevronDown() {
        let configuration = UIImage.SymbolConfiguration(scale: .small)
        let image = UIImage(systemName: "chevron.down", withConfiguration: configuration)
        rewardsButton.setImage(image, for: .normal)
    }
}
