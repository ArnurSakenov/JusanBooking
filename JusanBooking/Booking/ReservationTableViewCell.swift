//
//  ReservationTableViewCell.swift
//  JusanBooking
//
//  Created by Arnur Sakenov on 13.05.2023.
//

import UIKit

class ReservationTableViewCell: UITableViewCell {
    static let identifier = "ReservationTableViewCell"
    
    private let dayOfWeekLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        return label
    }()
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.borderColor = UIColor.orange.cgColor
        view.layer.borderWidth = 1.0
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private let exactDateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .orange
        return label
    }()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        return label
    }()
    
    private let eventTypeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemBlue
        return label
    }()
    
    private let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.orange
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubviews()
        setupConstraints()
        
        contentView.backgroundColor = .clear
        containerView.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        
        containerView.addSubview(dayOfWeekLabel)
        containerView.addSubview(exactDateLabel)
        containerView.addSubview(timeLabel)
        containerView.addSubview(eventTypeLabel)
        containerView.addSubview(separatorView)
        contentView.addSubview(containerView)
    }
    
    private func setupConstraints() {
        containerView.snp.makeConstraints { (make) in
            make.edges.equalTo(contentView).inset(10)
        }
        dayOfWeekLabel.snp.makeConstraints { (make) in
            make.top.equalTo(containerView.snp.top).offset(16)
            make.leading.equalTo(containerView.snp.leading).offset(16)
            make.trailing.lessThanOrEqualTo(containerView.snp.centerX)
        }
        
        exactDateLabel.snp.makeConstraints { (make) in
            make.top.equalTo(containerView.snp.top).offset(16)
            make.leading.greaterThanOrEqualTo(containerView.snp.centerX)
            make.trailing.equalTo(containerView.snp.trailing).offset(-16)
        }
        
        separatorView.snp.makeConstraints { (make) in
            make.top.equalTo(dayOfWeekLabel.snp.bottom).offset(8)
            make.leading.equalTo(containerView.snp.leading).offset(16)
            make.trailing.equalTo(containerView.snp.trailing).offset(-16)
            make.height.equalTo(1)
        }
        
        timeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(separatorView.snp.bottom).offset(16)
            make.leading.equalTo(containerView.snp.leading).offset(16)
            make.trailing.lessThanOrEqualTo(containerView.snp.centerX)
            make.bottom.equalTo(containerView.snp.bottom).offset(-16)
        }
        
        eventTypeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(separatorView.snp.bottom).offset(16)
            make.leading.greaterThanOrEqualTo(containerView.snp.centerX)
            make.trailing.equalTo(containerView.snp.trailing).offset(-16)
            make.bottom.equalTo(containerView.snp.bottom).offset(-16)
        }
    }
    
    func configure(with reservation: ReservationDTO) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"

            if let startDate = dateFormatter.date(from: reservation.period.startTime),
               let endDate = dateFormatter.date(from: reservation.period.endTime) {
                dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
                let exactDate = dateFormatter.string(from: startDate)
                dateFormatter.dateFormat = "HH:mm"
                let startTime = dateFormatter.string(from: startDate)
                let endTime = dateFormatter.string(from: endDate)

                dayOfWeekLabel.text = dateFormatter.weekdaySymbols[startDate.weekday - 1]
                exactDateLabel.text = exactDate
                timeLabel.text = "\(startTime) - \(endTime)"
                eventTypeLabel.text = reservation.description
            }
        }
}
extension Date {
    var weekday: Int {
        return Calendar.current.component(.weekday, from: self)
    }
}

