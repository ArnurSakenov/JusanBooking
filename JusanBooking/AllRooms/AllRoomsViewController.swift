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
        view.backgroundColor = #colorLiteral(red: 0.06831727177, green: 0.09892369062, blue: 0.1742413342, alpha: 1)
        setSubviews()
        title = "All rooms"
        navigationController?.navigationBar.prefersLargeTitles = true 
        setConstraints()
    }
    private let tableView: UITableView  = {
        let table = UITableView()
        table.backgroundColor = #colorLiteral(red: 0.06831727177, green: 0.09892369062, blue: 0.1742413342, alpha: 1)
        table.register(AllRoomsTableViewCell.self, forCellReuseIdentifier: AllRoomsTableViewCell.identifier)
        return table
    }()
    private func setSubviews(){
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    private func setConstraints(){
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
extension AllRoomsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard  let cell = tableView.dequeueReusableCell(withIdentifier: AllRoomsTableViewCell.identifier, for: indexPath) as? AllRoomsTableViewCell else {return UITableViewCell()}
        cell.configure(roomImage: UIImage(named: "coworking1")!, roomNumber: "1", capacity: "50", floor: "3")
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
