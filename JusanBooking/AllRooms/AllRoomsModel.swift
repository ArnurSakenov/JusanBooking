//
//  AllRoomsModel.swift
//  JusanBooking
//
//  Created by Arnur Sakenov on 11.05.2023.
//
struct RoomDTO: Decodable {
    let id: Int64
    let description: String
    let photo: String
    let type: String
    let capacity: Int64
    let floor: Int64
}
