//
//  RegistrationViewController.swift
//  JusanBooking
//
//  Created by Arnur Sakenov on 06.05.2023.
//

import UIKit

import SnapKit
class RegistrationViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Sign Up"
        view.backgroundColor = .white
        setConstraints()

        [userNameField, emailField, passwordField].forEach { field in
            field.delegate = self
        }
    }

    
    private let signGoogleButton: UIButton = {
        let button = UIButton()
        button.setTitle(" Continue with Google", for: .normal)
        button.setImage(UIImage(named: "google"), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        button.layer.cornerRadius = 12
        button.layer.borderColor = #colorLiteral(red: 0.58187747, green: 0.6370299459, blue: 0.7215286493, alpha: 1)
        button.layer.borderWidth = 1
        button.clipsToBounds = true
        return button
    }()
    
    private let signEmailButton: UIButton = {
        let button = UIButton()
        button.setTitle(" Continue with Email", for: .normal)
        button.setImage(UIImage(named: "mail"), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.234192282, green: 0.3481882215, blue: 0.5982336402, alpha: 1)
        button.layer.cornerRadius = 12
        button.clipsToBounds = true
        return button
    }()
    
    private let userNameField: UITextField = {
        let login = UITextField()
        login.backgroundColor = #colorLiteral(red: 0.9559774995, green: 0.9609488845, blue: 0.9608611465, alpha: 1)
        login.leftViewMode = .always
        login.attributedPlaceholder = NSAttributedString (
            string: "Username",
            attributes: [NSAttributedString.Key.foregroundColor : #colorLiteral(red: 0.58187747, green: 0.6370299459, blue: 0.7215286493, alpha: 1)])
                login.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: login.frame.height))
        login.keyboardType = .emailAddress
        login.font = UIFont.systemFont(ofSize: 16)
        login.autocapitalizationType = .none
        login.returnKeyType = .done
        login.layer.cornerRadius = 12
        login.clipsToBounds = true

        return login
        
    }()

    private let ageUserField: UITextField = {
        let login = UITextField()
        login.backgroundColor = #colorLiteral(red: 0.9559774995, green: 0.9609488845, blue: 0.9608611465, alpha: 1)
        login.leftViewMode = .always
        login.attributedPlaceholder = NSAttributedString (
            string: "Age",
            attributes: [NSAttributedString.Key.foregroundColor : #colorLiteral(red: 0.58187747, green: 0.6370299459, blue: 0.7215286493, alpha: 1)])
                login.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: login.frame.height))
        login.keyboardType = .emailAddress
        login.font = UIFont.systemFont(ofSize: 16)
        login.autocapitalizationType = .none
        login.returnKeyType = .done
        login.layer.cornerRadius = 12
        login.clipsToBounds = true
        return login
    }()
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard when the user taps the "Done" button
        textField.resignFirstResponder()
        return true
    }
    
    private let emailField: UITextField = {
        let email = UITextField()
        email.backgroundColor = #colorLiteral(red: 0.9559774995, green: 0.9609488845, blue: 0.9608611465, alpha: 1)
        email.leftViewMode = .always
        email.attributedPlaceholder = NSAttributedString (
            string: "Email",
            attributes: [NSAttributedString.Key.foregroundColor : #colorLiteral(red: 0.58187747, green: 0.6370299459, blue: 0.7215286493, alpha: 1)])
                email.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: email.frame.height))
        email.keyboardType = .emailAddress
        email.font = UIFont.systemFont(ofSize: 16)
        email.layer.cornerRadius = 12
        email.autocapitalizationType = .none
        email.returnKeyType = .done
        return email
        
    }()
    
    private let passwordField: UITextField = {
        let password = UITextField()
        
        password.attributedPlaceholder = NSAttributedString(
            string: "Password",
            attributes: [NSAttributedString.Key.foregroundColor : #colorLiteral(red: 0.58187747, green: 0.6370299459, blue: 0.7215286493, alpha: 1)])
        password.leftViewMode = .always
        password.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: password.frame.height))
        password.keyboardType = .default
        password.font = UIFont.systemFont(ofSize: 16)
//        password.autocapitalizationType = .none
        password.backgroundColor = #colorLiteral(red: 0.9559774995, green: 0.9609488845, blue: 0.9608611465, alpha: 1)
        password.returnKeyType = .done
        password.layer.cornerRadius = 12
        password.clipsToBounds = true
       
        let showHideButton = UIButton(type: .custom)
        
        showHideButton.setImage(UIImage(systemName: "eye"), for: .normal)
        showHideButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
        showHideButton.tintColor = .black
        showHideButton.addTarget(self, action: #selector(showHidePassword), for: .touchUpInside)
        password.rightViewMode = .always
        password.rightView = showHideButton
        
        return password
    }()
    
    
    
    
    
    private let networkStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 12
        return stackView
    }()
    
    private let userInformationStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 12
        return stackView
    }()
    
    private let toolbar: UIToolbar = {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        return toolbar
    }()

    private let signUpButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Sign Up", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0, green: 0.4780646563, blue: 0.9985368848, alpha: 1)
        button.addTarget(nil, action: #selector(signUp), for: .touchUpInside)
        button.layer.cornerRadius = 12
        button.clipsToBounds = true
        return button
    }()
    
    @objc func signUp (){

    }

    
    
    @objc private func showHidePassword(_ sender: UIButton) {
        if passwordField.isSecureTextEntry {
            passwordField.isSecureTextEntry = false // Disable secure text entry
            sender.setImage(UIImage(systemName: "eye"), for: .normal)
        } else {
            passwordField.isSecureTextEntry = true // Enable secure text entry
            sender.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        }
    }
    
    private let logInButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Log In", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .regular)
        button.setTitleColor(.systemBlue, for: .normal)
//        button.addTarget(nil, action: #selector(signUp), for: .touchUpInside)
        return button
    }()
    
    private let haveAccountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = #colorLiteral(red: 0.58187747, green: 0.6370299459, blue: 0.7215286493, alpha: 1)
        label.text = "Already have an account?"
        return label
    }()
    
    private let haveAccountStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 4
        stack.clipsToBounds = true
        return stack
    }()
    
    func setConstraints() {
        view.addSubview(networkStackView)
        view.addSubview(userInformationStackView)
        view.addSubview(haveAccountStackView)
        view.addSubview(signUpButton)
        
        networkStackView.addArrangedSubview(signEmailButton)
        networkStackView.addArrangedSubview(signGoogleButton)
        
        userInformationStackView.addArrangedSubview(userNameField)
        userInformationStackView.addArrangedSubview(ageUserField)
        userInformationStackView.addArrangedSubview(emailField)
        userInformationStackView.addArrangedSubview(passwordField)

        
        haveAccountStackView.addArrangedSubview(haveAccountLabel)
        haveAccountStackView.addArrangedSubview(logInButton)
        
        networkStackView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(30)
            make.width.equalTo(view.frame.size.width - 60)
            make.leading.equalTo(view).offset(30)
        }
        
        userInformationStackView.snp.makeConstraints { make in
            make.top.equalTo(networkStackView.snp_bottomMargin).offset(78)
            make.width.equalTo(view.frame.size.width - 60)
            make.leading.equalTo(view).offset(30)
        }
        
        signUpButton.snp.makeConstraints { make in
            make.top.equalTo(userInformationStackView.snp_bottomMargin).offset(80)
            make.width.equalTo(view.frame.size.width - 60)
            make.leading.equalTo(view).offset(30)
        }
        
        haveAccountLabel.snp.makeConstraints { make in
            make.top.equalTo(signUpButton.snp_bottomMargin).offset(24)
            make.leading.equalTo(view).offset(70)
        }
    }
}

