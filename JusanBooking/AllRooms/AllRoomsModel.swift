//
//  AllRoomsModel.swift
//  JusanBooking
//
//  Created by Arnur Sakenov on 11.05.2023.
//
import Foundation
struct RoomDTO: Decodable {
    let id: Int
    let description: String
    let photos: [Photo]
    let type: String
    let capacity: Int
    let floor: Int
    let reservationList: [Reservation]
    
    struct Photo: Decodable {
        let photoId: Int
        let roomId: Int
        let name: String
    }
    
    struct Reservation: Decodable {
        let reservationId: Int
        let period: Period
        let userId: Int
        let description: String
        
        struct Period: Decodable {
            let clientId: Int
            let roomId: Int
            let startTime: Date
            let endTime: Date
        }
    }
}
