//
//  ViewController.swift
//  RxSwiftSample
//
//  Created by Kazunori Takaishi on 2018/04/29.
//  Copyright © 2018 Kazunori Takaishi. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

final class LoginViewController: UIViewController {

    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    let viewModel = LoginViewModel()
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        _ = userNameField.rx.text.map { $0 ?? "" }.bind(to: viewModel.userName)
        _ = passwordField.rx.text.map { $0 ?? "" }.bind(to: viewModel.password)
        _ = viewModel.isValid.bind(to: loginButton.rx.isEnabled)
        _ = viewModel.isValid.subscribe(onNext: {[weak self] isValid in
            self?.loginButton.backgroundColor? = isValid ? UIColor.gray : UIColor.gray.withAlphaComponent(0.3)
        })
    }
    // MARK: - Action
    @IBAction func tapLoginButton(_ sender: UIButton) {
        // attempt to login
        viewModel.attemptToLogin()
    }
}

