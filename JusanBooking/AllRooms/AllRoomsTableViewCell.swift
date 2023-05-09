//
//  AllRoomsTableViewCell.swift
//  JusanBooking
//
//  Created by Arnur Sakenov on 09.05.2023.
//

import UIKit
import UIKit

class AllRoomsTableViewCell: UITableViewCell {
    static let identifier = "allroomstableviewcell"
    
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        contentView.addSubview(roomImageView)
        contentView.addSubview(roomNumberLabel)
        contentView.addSubview(capacityLabel)
        contentView.addSubview(floorLabel)
    }
    private func setupConstraints() {
        roomImageView.snp.makeConstraints { (make) in
            make.leading.equalTo(contentView.snp.leading).offset(16)
            make.top.equalTo(contentView.snp.top).offset(16)
            make.bottom.equalTo(contentView.snp.bottom).offset(-16)
            make.width.equalTo(150)
            make.height.equalTo(250)
        }
        
        roomNumberLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(roomImageView.snp.trailing).offset(16)
            make.top.equalTo(contentView.snp.top).offset(16)
            make.trailing.lessThanOrEqualTo(contentView.snp.trailing).offset(-16)
        }
        
        capacityLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(roomImageView.snp.trailing).offset(16)
            make.top.equalTo(roomNumberLabel.snp.bottom).offset(8)
            make.trailing.lessThanOrEqualTo(contentView.snp.trailing).offset(-16)
        }
        
        floorLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(roomImageView.snp.trailing).offset(16)
            make.top.equalTo(capacityLabel.snp.bottom).offset(8)
            make.trailing.lessThanOrEqualTo(contentView.snp.trailing).offset(-16)
        }
    }
    
    func configure(roomImage: UIImage, roomNumber: String, capacity: String, floor: String) {
        roomImageView.image = roomImage
        roomNumberLabel.text = "Room \(roomNumber)"
        capacityLabel.text = "Capacity: \(capacity)"
        floorLabel.text = "Floor: \(floor)"
    }
}
