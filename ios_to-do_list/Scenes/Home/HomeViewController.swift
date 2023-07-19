//
//  HomeViewController.swift
//  ios_to-do_list
//
//  Created by Hua Son Tung on 18/07/2023.
//

import UIKit

class HomeViewController: UIViewController, Bindable {
    var viewModel: HomeViewModel!

    func bindViewModel() {
        print("Binding Home...")
    }

    @IBOutlet weak var testView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        testView.backgroundColor = .systemPink
    }
}
