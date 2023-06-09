//
//  LoginViewController.swift
//  JusanBooking
//
//  Created by Arnur Sakenov on 06.05.2023.
//

import UIKit
import SnapKit
import Alamofire
class LoginViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.06831727177, green: 0.09892369062, blue: 0.1742413342, alpha: 1)
        
        self.title = "Sign In"
        
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [ NSAttributedString.Key.foregroundColor : UIColor.white ]
        addSubviews()
        setContstraints()
    }
    
    private let contentView = UIView()
    private let emailField = UITextField()
    private let passwordField = UITextField()
    private let signInButton = UIButton()
    private let buttonStackView = UIStackView()
    private let forgotPasswordButton = UIButton()
    private let forgotPassword = UILabel()
    private let labelStackView = UIStackView()
    
    func addSubviews() {
        view.addSubview(contentView)
        contentView.addSubview(buttonStackView)
        toggleVisibilityButton.addSubview(eyeIcon)
        toggleVisibilityButton.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
        contentView.addSubview(signInButton)
        contentView.addSubview(labelStackView)
        contentView.addSubview(welcomeLabel)
    }
    
    func setContstraints() {
        
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        configureButtonStackView()
        configureSignInButton()
        signInButton.snp.makeConstraints { make in
            make.top.equalTo(buttonStackView.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
            make.height.equalTo(50)
        }
        welcomeLabel.snp.makeConstraints { make in
            make.bottom.equalTo(buttonStackView.snp.top).offset(-5)
            make.leading.equalToSuperview().offset(24)
            make.width.equalTo(214)
            make.height.equalTo(100)
        }
        configureLabelStackView()
    }
    private let welcomeLabel: UILabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.frame = CGRect(x: 0, y: 0, width: 214, height: 100)
        view.backgroundColor = #colorLiteral(red: 0.06831727177, green: 0.09892369062, blue: 0.1742413342, alpha: 1)
        view.textColor = #colorLiteral(red: 0.9191874266, green: 0.3177170753, blue: 0.1384931207, alpha: 1)
        view.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.02
        // Line height: 30 pt
        view.attributedText = NSMutableAttributedString(string: "Welcome,\nPlease Login First", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        return view
    }()
    func configureButtonStackView() {
        
        buttonStackView.axis = .vertical
        buttonStackView.spacing = 12
        buttonStackView.addArrangedSubview(emailField)
        buttonStackView.addArrangedSubview(passwordField)
       
        buttonStackView.snp.makeConstraints { make in
//            make.top.equalTo(contentView.snp.top).offset(124)
            make.centerY.equalTo(contentView.snp.centerY)
            make.leading.equalTo(contentView.snp.leading).offset(24)
            make.trailing.equalTo(contentView.snp.trailing).offset(-24)
        }
        
        configureEmailField()
        configurePasswordField()
    }
    
    func configureEmailField() {
        emailField.placeholder = "Email"
        emailField.backgroundColor = #colorLiteral(red: 0.1160912886, green: 0.1620997787, blue: 0.2332904935, alpha: 1)
        emailField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        emailField.leftViewMode = .always
        emailField.font = UIFont.systemFont(ofSize: 16)
        emailField.textColor = .white
        emailField.autocapitalizationType = .none
        emailField.layer.cornerRadius = 8
        emailField.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
    }
    
    func configurePasswordField() {
        passwordField.placeholder = "Password"
        passwordField.backgroundColor = #colorLiteral(red: 0.1160912886, green: 0.1620997787, blue: 0.2332904935, alpha: 1)
        passwordField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        passwordField.leftViewMode = .always
        passwordField.font = UIFont.systemFont(ofSize: 16)
        passwordField.textColor = .white
        passwordField.layer.cornerRadius = 8
        passwordField.autocapitalizationType = .none
        passwordField.rightViewMode = .always
        passwordField.rightView = toggleVisibilityButton
        passwordField.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
    }
    private let toggleVisibilityButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
    func configureLabelStackView() {
        labelStackView.axis = .horizontal
        labelStackView.spacing = 1
        labelStackView.addArrangedSubview(forgotPassword)
        labelStackView.addArrangedSubview(forgotPasswordButton)
        
        labelStackView.snp.makeConstraints { make in
            make.top.equalTo(signInButton.snp.bottom).offset(24)
            make.centerX.equalToSuperview()
        }
        
        configureForgotPasswordButton()
        configureForgotPasswordLabel()
    }

    
    func configureForgotPasswordButton() {
        forgotPasswordButton.setTitle("Forgot password?", for: .normal)
        forgotPasswordButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        forgotPasswordButton.setTitleColor(#colorLiteral(red: 0.9191874266, green: 0.3177170753, blue: 0.1384931207, alpha: 1), for: .normal)
        //forgotPasswordButton.addTarget(nil, action: #selector(forgotPasswordTapped), for: .touchUpInside)
    }
    
    func configureForgotPasswordLabel() {
        forgotPassword.text = "Don't have an account? "
        forgotPassword.font = .systemFont(ofSize: 16, weight: .regular)
        forgotPassword.textColor = .white
    }

    func configureSignInButton() {
        signInButton.setTitle("Sign In", for: .normal)
        signInButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        signInButton.setTitleColor(.white, for: .normal)
        signInButton.backgroundColor = #colorLiteral(red: 0.9191874266, green: 0.3177170753, blue: 0.1384931207, alpha: 1)
        signInButton.layer.cornerRadius = 8
        signInButton.addTarget(self, action: #selector(signIn), for: .touchUpInside)
    }
    
    @objc func signIn() {
        guard let email = emailField.text, let password = passwordField.text else { return }
        NetworkManager.shared.login(email: email, password: password) { token, userId, error in
            print(token)
            if let error = error {
                print("Request failed with error: \(error)")
                let alertController = UIAlertController(title: "Error", message: "Invalid email or password.", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .default))
                self.present(alertController, animated: true)
            } else if let token = token, let userId = userId {
                UserDefaults.standard.set(token, forKey: "jwtToken")
                UserDefaults.standard.set(userId, forKey: "userId") // Save userId in UserDefaults
                let allRoomsViewController = AllRoomsViewController()
                self.navigationController?.pushViewController(allRoomsViewController, animated: true)
            } else {
                let alertController = UIAlertController(title: "Error", message: "Invalid email or password.", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .default))
                self.present(alertController, animated: true)
            }
        }
    }


}
