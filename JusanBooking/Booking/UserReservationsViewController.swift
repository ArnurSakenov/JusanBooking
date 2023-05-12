// UserReservationsViewController.swift
// JusanBooking
//
// Created by Arnur Sakenov on 13.05.2023.

import UIKit

class UserReservationsViewController: UITableViewController {
    
    var reservations: [ReservationDTO] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(ReservationTableViewCell.self, forCellReuseIdentifier: ReservationTableViewCell.identifier)
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 150
        
        NetworkManager.shared.getUserReservations { [weak self] (reservations, error) in
            if let error = error {
                print("Error fetching reservations: \(error)")
            } else if let reservations = reservations {
                self?.reservations = reservations
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reservations.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ReservationTableViewCell.identifier, for: indexPath) as! ReservationTableViewCell

            let reservation = reservations[indexPath.row]
            cell.configure(with: reservation)

            return cell
    }
}
