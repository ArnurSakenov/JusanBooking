//
//  WelcomeViewController.swift
//  JusanBooking
//
//  Created by Arnur Sakenov on 07.05.2023.
//

import UIKit
import SnapKit
class WelcomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setConstraints()
        imageAnimated()
    }
    private let backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "woman")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var indicatorImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "indicatorWoman")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var buttonStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 12
        stack.clipsToBounds = true
        return stack
    }()
    
    var labelStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 1
        stack.clipsToBounds = true
        return stack
    }()
    
    var signEmailButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(" Sign In with Email", for: .normal)
        button.setImage(UIImage(named: "mail"), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.1551918685, green: 0.7838412523, blue: 0.2506273389, alpha: 1)
        button.addTarget(nil, action: #selector(signEmailTap), for: .touchUpInside)
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        return button
    }()
    
    var signUpButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Sign up", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        button.setTitleColor(#colorLiteral(red: 0.1551918685, green: 0.7838412523, blue: 0.2506273389, alpha: 1), for: .normal)
        button.addTarget(nil, action: #selector(signUp), for: .touchUpInside)
        return button
    }()
    
    var notAmemberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .white
        label.text = "Not a member?"
        return label
    }()
    
    
    @objc func signUp(){
        let signUpVC = LoginViewController()
        navigationController?.pushViewController(signUpVC, animated: true)
    }
    
    @objc func signEmailTap(){
        let emailVC = LoginViewController()
        navigationController?.pushViewController(emailVC, animated: true)
    }
    
    
    func addSubviews(){
        view.addSubview(backgroundImage)
        view.addSubview(contentView)
        
        contentView.addSubview(indicatorImage)
        contentView.addSubview(buttonStackView)
        contentView.addSubview(labelStackView)
        
        buttonStackView.addArrangedSubview(signEmailButton)
        
        labelStackView.addArrangedSubview(notAmemberLabel)
        labelStackView.addArrangedSubview(signUpButton)
    }
    
    func setConstraints(){
        backgroundImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        contentView.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
       
        NSLayoutConstraint.activate([
        
        indicatorImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 650),
        indicatorImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 180),
        indicatorImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -180),
        indicatorImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -200),
        
        buttonStackView.topAnchor.constraint(equalTo: indicatorImage.bottomAnchor, constant: 46),
        buttonStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
        buttonStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
        buttonStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -88),
        
        labelStackView.topAnchor.constraint(equalTo: buttonStackView.bottomAnchor, constant: 24),
        labelStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 104),
        labelStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -104),
        labelStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -42)
        ])
    }
    
    func imageAnimated(){
        
        Timer.scheduledTimer(withTimeInterval: 4, repeats: true){_ in
            if self.backgroundImage.image == UIImage(named: "coworking1"){
                self.backgroundImage.image = UIImage(named: "coworking2")
                self.indicatorImage.image = UIImage(named: "indicatorCoworking2")
            } else {
                    self.backgroundImage.image = UIImage(named: "coworking1")
                self.indicatorImage.image = UIImage(named: "indicatorCoworking1")
                
            }
        }
    }
    
}
