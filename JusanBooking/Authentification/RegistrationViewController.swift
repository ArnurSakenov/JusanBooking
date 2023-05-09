//
//  RegistrationViewController.swift
//  JusanBooking
//
//  Created by Arnur Sakenov on 06.05.2023.
//

import UIKit
import SnapKit
class SignUpViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.06831727177, green: 0.09892369062, blue: 0.1742413342, alpha: 1)
        self.title = "Sign Up"
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [ NSAttributedString.Key.foregroundColor : UIColor.white ]
        navigationController?.navigationBar.prefersLargeTitles = false
        
        addSubviews()
        setConstraints()
    }
    
    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private let eyeIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "eye")
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .white
        return imageView
    }()
    @objc func togglePasswordVisibility() {
        passwordField.isSecureTextEntry.toggle()
        let eyeImageName = passwordField.isSecureTextEntry ? "eye" : "eye.slash"
        eyeIcon.image = UIImage(systemName: eyeImageName)
    }
    private let toggleVisibilityButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    private let nameField: UITextField = {
        let login = UITextField()
        login.translatesAutoresizingMaskIntoConstraints = false
        login.backgroundColor = #colorLiteral(red: 0.1160912886, green: 0.1620997787, blue: 0.2332904935, alpha: 1)
        login.leftViewMode = .always
        login.attributedPlaceholder = NSAttributedString (
            string: "Name",
            attributes: [NSAttributedString.Key.foregroundColor : #colorLiteral(red: 0.58187747, green: 0.6370299459, blue: 0.7215286493, alpha: 1)])
        login.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: login.frame.height))
        login.keyboardType = .emailAddress
        login.textColor = .white
        login.font = UIFont.systemFont(ofSize: 16)
        login.autocapitalizationType = .none
        login.returnKeyType = .done
        login.layer.cornerRadius = 8
        login.clipsToBounds = true
        return login
        
    }()
    private let surnameField: UITextField = {
        let login = UITextField()
        login.translatesAutoresizingMaskIntoConstraints = false
        login.backgroundColor = #colorLiteral(red: 0.1160912886, green: 0.1620997787, blue: 0.2332904935, alpha: 1)
        login.leftViewMode = .always
        login.attributedPlaceholder = NSAttributedString (
            string: "Surname",
            attributes: [NSAttributedString.Key.foregroundColor : #colorLiteral(red: 0.58187747, green: 0.6370299459, blue: 0.7215286493, alpha: 1)])
        login.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: login.frame.height))
        login.keyboardType = .emailAddress
        login.textColor = .white
        login.font = UIFont.systemFont(ofSize: 16)
        login.autocapitalizationType = .none
        login.returnKeyType = .done
        login.layer.cornerRadius = 8
        login.clipsToBounds = true
        return login
        
    }()
    
    private let emailField: UITextField = {
        let email = UITextField()
        email.translatesAutoresizingMaskIntoConstraints = false
        email.backgroundColor = #colorLiteral(red: 0.1160912886, green: 0.1620997787, blue: 0.2332904935, alpha: 1)
        email.leftViewMode = .always
        email.attributedPlaceholder = NSAttributedString (
            string: "Email",
            attributes: [NSAttributedString.Key.foregroundColor : #colorLiteral(red: 0.58187747, green: 0.6370299459, blue: 0.7215286493, alpha: 1)])
        email.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: email.frame.height))
        email.keyboardType = .emailAddress
        email.textColor = .white
        email.font = UIFont.systemFont(ofSize: 16)
        email.layer.cornerRadius = 8
        
        email.autocapitalizationType = .none
        email.returnKeyType = .done
        
        
        return email
        
    }()
    
    private lazy var passwordField: UITextField = {
        let password = UITextField()
        password.translatesAutoresizingMaskIntoConstraints = false
        password.layer.borderColor = UIColor.lightGray.cgColor
        password.layer.borderWidth = 0
        password.attributedPlaceholder = NSAttributedString (
            string: "Password",
            attributes: [NSAttributedString.Key.foregroundColor : #colorLiteral(red: 0.58187747, green: 0.6370299459, blue: 0.7215286493, alpha: 1)])
        password.leftViewMode = .always
        password.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: password.frame.height))
        password.keyboardType = .default
        password.textColor = .white
        password.font = UIFont.systemFont(ofSize: 16)
        password.autocapitalizationType = .none
        password.backgroundColor = #colorLiteral(red: 0.1160912886, green: 0.1620997787, blue: 0.2332904935, alpha: 1)
        password.returnKeyType = .done
        password.layer.cornerRadius = 8
        password.rightViewMode = .always
        password.rightView = toggleVisibilityButton
        password.clipsToBounds = true
        password.isSecureTextEntry = true
        return password
        
    }()
    
    
    private let continueButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Continue", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        button.setTitleColor(.white, for: .normal)
        //button.addTarget(nil, action: #selector(verify), for: .touchUpInside)
        button.backgroundColor = #colorLiteral(red: 0.9191874266, green: 0.3177170753, blue: 0.1384931207, alpha: 1)
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        return button
    }()
    
    private let buttonStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        //stack.alignment = .center
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 12
        stack.clipsToBounds = true
        return stack
    }()
    
    
    private let signInButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Sign In", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        button.setTitleColor(#colorLiteral(red: 0.9191874266, green: 0.3177170753, blue: 0.1384931207, alpha: 1), for: .normal)
        // button.setTitleColor(#colorLiteral(red: 0.1551918685, green: 0.7838412523, blue: 0.2506273389, alpha: 1), for: .normal)
        button.addTarget(nil, action: #selector(signIn), for: .touchUpInside)
        return button
    }()
    
    private let haveAccountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .white
        label.text = "Already have an account?"
        return label
    }()
    
    
    @objc func signIn (){
        let signIn = LoginViewController()
        navigationController?.pushViewController(signIn, animated: true)
        
    }
    
    
    private let labelStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 1
        stack.clipsToBounds = true
        return stack
    }()
    
    func addSubviews(){
        view.addSubview(contentView)
        contentView.addSubview(buttonStackView)
        toggleVisibilityButton.addSubview(eyeIcon)
        toggleVisibilityButton.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
        buttonStackView.addArrangedSubview(nameField)
        buttonStackView.addArrangedSubview(surnameField)
        buttonStackView.addArrangedSubview(emailField)
        buttonStackView.addArrangedSubview(passwordField)
        buttonStackView.addArrangedSubview(continueButton)
        labelStackView.addArrangedSubview(haveAccountLabel)
        labelStackView.addArrangedSubview(signInButton)
        contentView.addSubview(labelStackView)
    }
    
    func setConstraints() {
        contentView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        buttonStackView.snp.makeConstraints { (make) in
            make.centerY.equalTo(contentView.snp.centerY)
            make.leading.equalTo(contentView.snp.leading).offset(24)
            make.trailing.equalTo(contentView.snp.trailing).offset(-24)
            make.height.equalTo(240)
        }
        
        
        [nameField, surnameField, emailField, passwordField].forEach { field in
            field.snp.makeConstraints { (make) in
                make.height.equalTo(44)
            }
        }
        
        continueButton.snp.makeConstraints { (make) in
            make.height.equalTo(44)
        }
        
        labelStackView.snp.makeConstraints { (make) in
            make.top.equalTo(buttonStackView.snp.bottom).offset(24)
            make.centerX.equalTo(contentView.snp.centerX)
        }
        
        haveAccountLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(labelStackView.snp.centerY)
        }
        eyeIcon.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview().offset(-10)
            make.width.equalTo(24)
            make.height.equalTo(24)
        }
        
        
        signInButton.snp.makeConstraints { (make) in
            make.centerY.equalTo(labelStackView.snp.centerY)
        }
    }
}

