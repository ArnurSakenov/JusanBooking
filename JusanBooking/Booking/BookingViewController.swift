//
//  BookingViewController.swift
//  JusanBooking
//
//  Created by Arnur Sakenov on 11.05.2023.
//


import UIKit

import UIKit
import SnapKit

class BookingViewController: UIViewController {
    
    private let bookingReasonLabel: UILabel = {
        let label = UILabel()
        label.text = "Reason for booking"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    private let bookingReasonField: UITextField = {
        let field = UITextField()
        field.placeholder = "Enter the reason for booking"
        field.borderStyle = .roundedRect
        return field
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "Date"
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    private let datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        return picker
    }()
    
    private let startTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "Start Time"
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    private let startTimePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .time
        return picker
    }()
    
    private let endTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "End Time"
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    private let endTimePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .time
        return picker
    }()
    
    private let bookButton: UIButton = {
        let button = UIButton()
        button.setTitle("Book", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.9191874266, green: 0.3177170753, blue: 0.1384931207, alpha: 1)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.06831727177, green: 0.09892369062, blue: 0.1742413342, alpha: 1)
        setupSubviews()
        setupConstraints()
    }
    
    private func setupSubviews() {
        view.addSubview(bookingReasonLabel)
        view.addSubview(bookingReasonField)
        view.addSubview(dateLabel)
        view.addSubview(datePicker)
        view.addSubview(startTimeLabel)
        view.addSubview(startTimePicker)
        view.addSubview(endTimeLabel)
        view.addSubview(endTimePicker)
        view.addSubview(bookButton)
    }
    
    private func setupConstraints() {
        bookingReasonLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.leading.equalTo(view.snp.leading).offset(16)
        }
        
        bookingReasonField.snp.makeConstraints { make in
            make.top.equalTo(bookingReasonLabel.snp.bottom).offset(8)
            make.leading.equalTo(view.snp.leading).offset(16)
            make.trailing.equalTo(view.snp.trailing).offset(-16)
        }
        
        
        datePicker.snp.makeConstraints { make in
            make.top.equalTo(bookingReasonField.snp.bottom).offset(20)
            make.leading.equalTo(view.snp.leading).offset(16)
            make.trailing.equalTo(view.snp.trailing).offset(-16)
        }
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(datePicker.snp.top).offset(5)
            make.leading.equalTo(view.snp.leading).offset(16)
        }
        
        startTimePicker.snp.makeConstraints { make in
            make.top.equalTo(datePicker.snp.bottom).offset(8)
            make.leading.equalTo(view.snp.leading).offset(16)
            make.trailing.equalTo(view.snp.trailing).offset(-16)
        }
        
        startTimeLabel.snp.makeConstraints { make in
            make.top.equalTo(startTimePicker.snp.top).offset(5)
            make.leading.equalTo(view.snp.leading).offset(16)
        }
       
        
        endTimePicker.snp.makeConstraints { make in
            make.top.equalTo(startTimePicker.snp.bottom).offset(8)
            make.leading.equalTo(view.snp.leading).offset(16)
            make.trailing.equalTo(view.snp.trailing).offset(-16)
        }
        
        endTimeLabel.snp.makeConstraints { make in
            make.top.equalTo(endTimePicker.snp.top).offset(5)
            make.leading.equalTo(view.snp.leading).offset(16)
        }
        
       
        
        bookButton.snp.makeConstraints { make in
            make.top.equalTo(endTimePicker.snp.bottom).offset(20)
            make.leading.equalTo(view.snp.leading).offset(16)
            make.trailing.equalTo(view.snp.trailing).offset(-16)
            make.height.equalTo(50)
        }
    }
}


