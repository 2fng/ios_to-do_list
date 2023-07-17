//
//  MainViewController.swift
//  ios_to-do_list
//
//  Created by Hua Son Tung on 17/07/2023.
//

import UIKit
import CHGlassmorphismView

final class MainViewController: UITabBarController, Bindable {
    var viewModel: MainViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("Main view did load")
        self.tabBar.backgroundColor = .black
        let firstViewController = UIViewController()
        firstViewController.view.backgroundColor = .blue
        firstViewController.title = "First"

        let secondViewController = UIViewController()
        secondViewController.view.backgroundColor = .green
        secondViewController.title = "Second"

        let thirdViewController = UIViewController()
        thirdViewController.view.backgroundColor = .white
        thirdViewController.title = "Third"

        let fourthViewController = UIViewController()
        fourthViewController.view.backgroundColor = .orange
        fourthViewController.title = "Fourth"

        let fifthViewController = UIViewController()
        fifthViewController.view.backgroundColor = .yellow
        fifthViewController.title = "Fifth"

        self.setViewControllers([firstViewController, secondViewController, thirdViewController, fourthViewController, fifthViewController], animated: true)
        self.selectedIndex = 2
    }

    func bindViewModel() {
        print("Binding...")
    }
}
