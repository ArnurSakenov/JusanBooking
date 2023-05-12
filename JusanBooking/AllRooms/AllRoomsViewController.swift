//
//  ViewController.swift
//  JusanBooking
//
//  Created by Arnur Sakenov on 06.05.2023.
//

import UIKit
import SnapKit
import Alamofire

final class AllRoomsViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.06831727177, green: 0.09892369062, blue: 0.1742413342, alpha: 1)
        setSubviews()
        title = "All rooms"
        navigationController?.navigationBar.prefersLargeTitles = true
        fetchRooms()
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
    var rooms = [RoomDTO]()
    private func fetchRooms() {
            let defaults = UserDefaults.standard
            let token = defaults.string(forKey: "jwtToken") ?? ""
            print(token)
            NetworkManager.shared.fetchRooms(token: token) { (rooms, error) in
                guard let fetchedRooms = rooms else {
                    print("Error fetching rooms: \(String(describing: error))")
                    return
                }
                self.rooms = fetchedRooms
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    private func setConstraints(){
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
extension AllRoomsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rooms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard  let cell = tableView.dequeueReusableCell(withIdentifier: AllRoomsTableViewCell.identifier, for: indexPath) as? AllRoomsTableViewCell else {return UITableViewCell()}
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AllRoomsTableViewCell.identifier, for: indexPath) as? AllRoomsTableViewCell else {return UITableViewCell()}
           let room = rooms[indexPath.row]
        if let url = URL(string: room.photos[0].name) {
            // использовать url здесь
            
            cell.configure(roomImageUrl: url, roomNumber: "\(room.id)", capacity: "\(room.capacity)", floor: "\(room.floor)")}
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
