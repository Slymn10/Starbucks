import UIKit

class Tile: UIView {
    let imageView = UIImageView()
    let titleLabel = UILabel()
    let subTitleLabel = UILabel()
    let ctaButton = makeGreenButton(withText: "Order")
    override init(frame: CGRect) {
        super.init(frame: .zero)
        style()
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private var shadowLayer: CAShapeLayer!
    private var cornerRadius: CGFloat = 6
    private var fillColor : UIColor = .white

    override func layoutSubviews() {
        super.layoutSubviews()
        addShadow()
    }
    private func addShadow(){
        shadowLayer = CAShapeLayer()
        shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
        shadowLayer.fillColor = fillColor.cgColor
        shadowLayer.shadowColor = UIColor.black.cgColor
        shadowLayer.shadowPath = shadowLayer.path
        shadowLayer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        shadowLayer.shadowOpacity = 0.4
        shadowLayer.shadowRadius = 2
        layer.insertSublayer(shadowLayer, at: 0)

    }


}

extension Tile{
    private func style(){

        imageView.translatesAutoresizingMaskIntoConstraints = false
        //2imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true


        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = .boldSystemFont(ofSize: 25)
        titleLabel.textColor = .black

        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subTitleLabel.font = .systemFont(ofSize: 20)
        subTitleLabel.numberOfLines = 0
        subTitleLabel.lineBreakMode = .byWordWrapping
        subTitleLabel.textColor = .black


        ctaButton.translatesAutoresizingMaskIntoConstraints = false


    }

    private func layout(){
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(subTitleLabel)
        addSubview(ctaButton)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),

            titleLabel.topAnchor.constraint(equalToSystemSpacingBelow: imageView.bottomAnchor, multiplier: 2),
            titleLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            trailingAnchor.constraint(equalToSystemSpacingAfter: titleLabel.trailingAnchor, multiplier: 2),
            subTitleLabel.topAnchor.constraint(equalToSystemSpacingBelow: titleLabel.bottomAnchor, multiplier: 2),
            subTitleLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: titleLabel.leadingAnchor, multiplier: 0),
            subTitleLabel.trailingAnchor.constraint(equalToSystemSpacingAfter: titleLabel.trailingAnchor, multiplier: 0),
            ctaButton.topAnchor.constraint(equalToSystemSpacingBelow: subTitleLabel.bottomAnchor, multiplier: 2),
            ctaButton.leadingAnchor.constraint(equalToSystemSpacingAfter: titleLabel.leadingAnchor, multiplier: 0),
            bottomAnchor.constraint(equalToSystemSpacingBelow: ctaButton.bottomAnchor, multiplier: 2),

        ])
    }

    override var intrinsicContentSize: CGSize{
        return CGSize(width: 100, height: 400)
    }
}
