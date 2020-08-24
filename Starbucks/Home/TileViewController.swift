//
//  TileViewController.swift
//  Starbucks
//
//  Created by Süleyman Koçak on 23.08.2020.
//  Copyright © 2020 Suleyman Kocak. All rights reserved.
//

import UIKit

class TileViewController: UIViewController {
    let tileView = Tile()

    init(title:String,subTitle:String,imageName:String){
        super.init(nibName: nil, bundle: nil)

        tileView.titleLabel.text = title
        tileView.subTitleLabel.text = subTitle
        tileView.imageView.image = UIImage(named: imageName)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }

    private func style(){
        tileView.translatesAutoresizingMaskIntoConstraints = false
        
    }
    private func layout(){
        view.addSubview(tileView)

        NSLayoutConstraint.activate([
            tileView.topAnchor.constraint(equalTo: view.topAnchor),
            tileView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tileView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tileView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}
