//
//  RegistrationController.swift
//  TwitterTutorial
//
//  Created by Macbook on 07/02/2023.
//

import UIKit

class RegistrationController: UIViewController {
    
    // MARK: - Properties

    private let logoImageView: UIImageView = {
       let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.image = UIImage(named: "TwitterLogo")
        return iv
    }()
    
    private let alreadyHaveAccountButton: UIButton = {
        let button = Utilities().attributedButton("Already have an account?", " Sign In")
        button.addTarget(self, action: #selector(handleShowLogin), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Selectors
    
    @objc func handleShowLogin() {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        view.backgroundColor = .twitterBlue
        title = "Login"
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.isHidden = true

//        view.addSubview(logoImageView)
//        logoImageView.centerX(inView: view, topAnchor: view.safeAreaLayoutGuide.topAnchor)
//        logoImageView.setDimensions(width: 150, height: 150)
//
//        let stack = UIStackView(arrangedSubviews: [emailContainerView, passwordContainerView, loginButton])
//        stack.axis = .vertical
//        stack.spacing = 20
//        stack.distribution = .fillEqually
//
//        view.addSubview(stack)
//        stack.anchor(top: logoImageView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingLeft: 32, paddingRight: 32)
        view.addSubview(alreadyHaveAccountButton)
        alreadyHaveAccountButton.anchor(left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor,
                                     right: view.rightAnchor, paddingLeft: 40, paddingRight: 40)
    }
}

