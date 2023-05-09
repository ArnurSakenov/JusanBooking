//
//  RoomDetailViewController.swift
//  JusanBooking
//
//  Created by Arnur Sakenov on 09.05.2023.
//

import UIKit

class RoomDetailslViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setSubviews()
        setConstraints()
        roomImageView.image = UIImage(named: "coworking1")
        roomNumberLabel.text = "Room 1"
        capacityLabel.text = "Capacity: 1"
        floorLabel.text = "Floor: 1"
      
    }
    private let reservationTableView: UITableView  = {
        let table = UITableView()
        table.backgroundColor = #colorLiteral(red: 0.06831727177, green: 0.09892369062, blue: 0.1742413342, alpha: 1)
        table.register(RoomDetailsTableViewCell.self, forCellReuseIdentifier: RoomDetailsTableViewCell.identifier)
        return table
    }()
    private func setSubviews(){
        view.addSubview(reservationTableView)
        view.addSubview(roomImageView)
        detailsStackView.addArrangedSubview(roomNumberLabel)
        detailsStackView.addArrangedSubview(capacityLabel)
        detailsStackView.addArrangedSubview(floorLabel)
        view.addSubview(detailsStackView)
        reservationTableView.delegate = self
        reservationTableView.dataSource = self
        
    }
    private let detailsStackView: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .equalSpacing
        stack.axis = .vertical
        stack.backgroundColor = .systemBlue
        return stack
    }()
    private let roomImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let roomNumberLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let capacityLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let floorLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private func setConstraints(){
        
        roomImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalTo(view.safeAreaLayoutGuide)
            make.width.equalTo(200)
            make.height.equalTo(150)
        }
        detailsStackView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.trailing.equalTo(view.safeAreaLayoutGuide)
            make.width.equalTo(200)
            make.height.equalTo(150)
        }
        reservationTableView.snp.makeConstraints { make in
            make.top.equalTo(roomImageView.snp.bottom).offset(20)
            make.bottom.trailing.leading.equalTo(view.safeAreaLayoutGuide)
        }
        
    }

}
extension RoomDetailslViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard  let cell = tableView.dequeueReusableCell(withIdentifier: RoomDetailsTableViewCell.identifier, for: indexPath) as? RoomDetailsTableViewCell else {return UITableViewCell()}
        
        cell.backgroundColor = #colorLiteral(red: 0.06831727177, green: 0.09892369062, blue: 0.1742413342, alpha: 1)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(RoomDetailslViewController(), animated: true)
    }
}
