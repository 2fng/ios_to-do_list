//
//  MainViewController.swift
//  ios_to-do_list
//
//  Created by Hua Son Tung on 17/07/2023.
//

import UIKit
import RxSwift
import Then

private enum TabbarItem: Int {
    case home = 0
    case habits = 1
    case roomForButton = 2
    case groupsAndStats = 3
    case settings = 4
}

final class MainViewController: UITabBarController, Bindable {

    var viewModel: MainViewModel!
    var navigator: UINavigationController!

    private var assembler: Assembler = DefaultAssembler()
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("Main view did load")
        self.tabBar.addShape()
    }

    override func viewWillAppear(_ animated: Bool) {
        setupViewPages()
    }

    func bindViewModel() {
        print("Binding Main...")
    }

    func setupViewPages() {
        let homeViewController: HomeViewController = assembler.resolve(navigationController: navigator)
        configViewController(viewController: homeViewController, image: UIImage(named: "home"))

        let secondViewController = UIViewController()
        configViewController(viewController: secondViewController, image: UIImage(named: "clipboard"))

        let thirdViewController = UIViewController()
        configViewController(viewController: thirdViewController, image: UIImage(named: "stats"))

        let fourthViewController = UIViewController()
        configViewController(viewController: fourthViewController, image: UIImage(named: "settings"))

        self.do {
            $0.setViewControllers([homeViewController, secondViewController, UIViewController(), thirdViewController, fourthViewController], animated: true)
            $0.tabBar.tintColor = .primary
            $0.tabBar.unselectedItemTintColor = .tabbarUnselected
        }
    }

    private func configViewController(viewController: UIViewController, image: UIImage?) {
        viewController.tabBarItem.title = ""
        viewController.tabBarItem.image = image?.resizeImage(targetSize: Constants.tabbarIconSize)
        viewController.view.backgroundColor = .primaryDark
    }
}
