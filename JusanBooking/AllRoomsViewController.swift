//
//  ViewController.swift
//  JusanBooking
//
//  Created by Arnur Sakenov on 06.05.2023.
//

import UIKit

final class AllRoomsViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
    }
    private let tableView: UITableView  = {
        let table = UITableView()
        return table
    }()
}

