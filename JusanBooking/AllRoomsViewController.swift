//
//  ViewController.swift
//  JusanBooking
//
//  Created by Arnur Sakenov on 06.05.2023.
//

import UIKit
import SnapKit
final class AllRoomsViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        setSubviews()
        setConstraints()
    }
    private let tableView: UITableView  = {
        let table = UITableView()
        table.backgroundColor = .systemGreen
        return table
    }()
    private func setSubviews(){
        view.addSubview(tableView)
    }
    private func setConstraints(){
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
    }
}

