//
//  MainViewController.swift
//  ios_to-do_list
//
//  Created by Hua Son Tung on 17/07/2023.
//

import UIKit
import CHGlassmorphismView
import RxSwift

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
        homeViewController.title = "Home"

        let secondViewController = UIViewController()
        secondViewController.view.backgroundColor = .green
        secondViewController.title = "Habits"

        let thirdViewController = UIViewController()
        thirdViewController.view.backgroundColor = .white
        thirdViewController.title = "Groups & Stats"

        let fourthViewController = UIViewController()
        fourthViewController.view.backgroundColor = .orange
        fourthViewController.title = "Settings"

        self.setViewControllers([homeViewController, secondViewController, UIViewController(), thirdViewController, fourthViewController], animated: true)
    }
}
