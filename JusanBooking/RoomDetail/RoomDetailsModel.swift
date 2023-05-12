//
//  RoomDetailsModel.swift
//  JusanBooking
//
//  Created by Arnur Sakenov on 12.05.2023.
//

import Foundation

struct RoomDetailResponse: Codable {
    let id: Int
    let description: String
    let photos: [Photo]
    let type: String
    let capacity: Int
    let floor: Int
    let reservationList: [Reservation]
}

struct Photo: Codable {
    let photoId: Int
    let roomId: Int
    let name: String
}

struct Reservation: Codable {
    let reservationId: Int
    let period: Period
    let userId: Int
    let description: String
}

struct Period: Codable {
    let clientId: Int
    let roomId: Int
    let startTime: String
    let endTime: String
}
