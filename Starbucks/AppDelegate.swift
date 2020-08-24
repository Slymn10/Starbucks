//
//  AppDelegate.swift
//  Starbucks
//
//  Created by Süleyman Koçak on 23.08.2020.
//  Copyright © 2020 Suleyman Kocak. All rights reserved.
//

import UIKit

class StarbucksVC : UIViewController{
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        commonInit()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func commonInit(){

    }
    func setTabBarImage(imageName:String, title:String){
        let image = UIImage(systemName: imageName)
        tabBarItem = UITabBarItem(title: title, image: image, tag: 0)
    }
}
class ScanVC: StarbucksVC{
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemIndigo
        title = "Scan"
    }
    override func commonInit() {
        setTabBarImage(imageName: "qrcode", title: "Scan")
    }
}
class OrderVC: StarbucksVC{
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemOrange
        title = "Order"
    }
    override func commonInit() {
        setTabBarImage(imageName: "arrow.up.bin.fill", title: "Order")
    }
}
class GiftVC: StarbucksVC{
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
        title = "Gift"
    }
    override func commonInit() {
        setTabBarImage(imageName: "gift.fill", title: "Gift")
    }
}
class StoresVC: StarbucksVC{
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        title = "Stores"
    }
    override func commonInit() {
        setTabBarImage(imageName: "location.fill", title: "Stores")
    }
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground

        let homeVC = HomeVC()
        let scanNC = UINavigationController(rootViewController: ScanVC())
        let giftNC = UINavigationController(rootViewController: GiftVC())
        let orderNC = UINavigationController(rootViewController: OrderVC())
        let storesNC = UINavigationController(rootViewController: StoresVC())

        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [homeVC, scanNC, orderNC, giftNC, storesNC]
        tabBarController.tabBar.tintColor = .lightGreen
        tabBarController.tabBar.isTranslucent = false
        
        window?.rootViewController = tabBarController
        return true
    }
}

