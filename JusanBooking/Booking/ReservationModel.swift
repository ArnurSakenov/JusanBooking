//
//  ReservationModel.swift
//  JusanBooking
//
//  Created by Arnur Sakenov on 13.05.2023.
//
import Foundation
struct ReservationDTO: Decodable {
    let reservationId: Int
    let period: ReservationPeriod
    let userId: Int
    let description: String
}

struct ReservationPeriod: Decodable {
    let clientId: Int
    let roomId: Int
    let startTime: String
    let endTime: String
}
