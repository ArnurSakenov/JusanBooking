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
        view.backgroundColor = #colorLiteral(red: 0.06831727177, green: 0.09892369062, blue: 0.1742413342, alpha: 1)
        roomImageView.image = UIImage(named: "coworking1")
     
      
        
        
      
    }
    private let bookingButton: UIButton = {
        let bookingButton = UIButton()
        bookingButton.setTitle("BOOK THIS ROOM", for: .normal)
        bookingButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        bookingButton.setTitleColor(.white, for: .normal)
        bookingButton.backgroundColor = #colorLiteral(red: 0.9191874266, green: 0.3177170753, blue: 0.1384931207, alpha: 1)
        bookingButton.layer.cornerRadius = 8
       bookingButton.addTarget(self, action: #selector(singIn), for: .touchUpInside)
        return bookingButton
    }()
    @objc func singIn(){
        navigationController?.pushViewController(BookingViewController(), animated: true)
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
        detailsStackView.addArrangedSubview(roomCategoryLabel)
        detailsStackView.addArrangedSubview(roomNumberLabel)
        
        detailsStackView.addArrangedSubview(capacityLabel)
        detailsStackView.addArrangedSubview(floorLabel)
        containerView.addSubview(detailsStackView)
        view.addSubview(containerView)
        view.addSubview(bookingButton)
        reservationTableView.delegate = self
        reservationTableView.dataSource = self
        
    }
    private let containerView: UIView = {
           let view = UIView()
           view.backgroundColor = .white
           view.layer.borderColor = UIColor.orange.cgColor
           view.layer.borderWidth = 1.0
           view.layer.cornerRadius = 10
           view.translatesAutoresizingMaskIntoConstraints = false
           return view
       }()
    private let detailsStackView: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .fillProportionally
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
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
        label.textColor = .orange
        label.text = "Room:"
        return label
    }()
    
    
    private let roomCategoryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .orange
        label.text = "Category:"
        return label
    }()
    
    private let capacityLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .orange
        label.text = "Capacity:"
        return label
    }()
    
    private let floorLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .orange
        label.text = "Floor:"
        return label
    }()
    private let headerLabel: UILabel = {
           let label = UILabel()
           label.text = "Reservations"
           label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
           label.textAlignment = .center
           label.textColor = .white
           return label
       }()
    private func setConstraints(){
        
        roomImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalTo(view.safeAreaLayoutGuide)
            make.trailing.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(250)
        }
        containerView.snp.makeConstraints { make in
            make.top.equalTo(roomImageView.snp.bottom).offset(10)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-10)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.height.equalTo(150)
        }
        bookingButton.snp.makeConstraints { make in
            make.top.equalTo(containerView.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
            make.height.equalTo(50)
        }
        detailsStackView.snp.makeConstraints { make in
            make.top.equalTo(containerView.snp.top)
            make.leading.equalTo(containerView.snp.leading).offset(10)
            make.width.equalTo(containerView.snp.width).multipliedBy(0.5)
            make.bottom.equalTo(containerView.snp.bottom)
        }
        reservationTableView.snp.makeConstraints { make in
            make.top.equalTo(bookingButton.snp.bottom).offset(20)
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
        cell.configure(dayOfWeek: "Monday", exactDate: "19-10-2023", time: "12:30-13:00", eventType: "Lecture")
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        return headerLabel
//    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Reservations"
    }
   
}
