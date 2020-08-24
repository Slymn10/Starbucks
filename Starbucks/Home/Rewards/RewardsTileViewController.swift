import UIKit

class RewardsTileViewController: UIViewController {
    let rewardsTileView = RewardsTileView()
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    private func configureUI(){
        rewardsTileView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(rewardsTileView)
        NSLayoutConstraint.activate([
            rewardsTileView.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 0),
            rewardsTileView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 0),
            rewardsTileView.trailingAnchor.constraint(equalToSystemSpacingAfter: view.trailingAnchor, multiplier: 0),
            rewardsTileView.bottomAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.bottomAnchor, multiplier: 0),
        ])
    }
}
