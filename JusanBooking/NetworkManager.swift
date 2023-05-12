//
//  NetworkManager.swift
//  JusanBooking
//
//  Created by Arnur Sakenov on 12.05.2023.
//

import Alamofire
import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    func login(email: String, password: String, completion: @escaping (String?, Int?, Error?) -> Void) {
        let parameters: [String: Any] = [
            "email": email,
            "password": password
        ]
        
        AF.request("http://44.202.105.221:8087/signin", method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    if let JSON = value as? [String: Any] {
                        let token = JSON["jwtToken"] as? String
                        let userId = JSON["userId"] as? Int
                        completion(token, userId, nil)
                    } else {
                        let error = NSError(domain: "", code: 401, userInfo: [NSLocalizedDescriptionKey : "Invalid email or password."])
                        completion(nil, nil, error)
                    }
                case .failure(let error):
                    completion(nil, nil, error)
                }
            }
    }


    func register(name: String, surname: String, email: String, password: String, completion: @escaping (Bool, Error?) -> Void) {
        let parameters = [
            "name": name,
            "surname": surname,
            "email": email,
            "password": password
        ]
        
        AF.request("http://44.202.105.221:8087/signup", method: .post, parameters: parameters, encoder: JSONParameterEncoder.default)
            .validate()
            .response { response in
                switch response.result {
                case .success:
                    completion(true, nil)
                case let .failure(error):
                    completion(false, error)
                }
            }
    }

    func fetchRooms(id: Int, email: String, completion: @escaping ([RoomDTO]?, Error?) -> Void) {
        
        let token = UserDefaults.standard.string(forKey: "jwtToken") ?? ""
            let headers: HTTPHeaders = [
                "Authorization": "Bearer \(token)",
            ]
        
        let urlString = "http://44.202.105.221:8087/rooms?userId=\(id)"
        
        guard let url = URL(string: urlString) else {
            completion(nil, NSError(domain: "", code: 400, userInfo: [NSLocalizedDescriptionKey : "Invalid URL."]))
            print("error")
            return
        }

        AF.request(url, method: .get, headers: headers).response { response in
            guard let data = response.data else {
                completion(nil, NSError(domain: "", code: 401, userInfo: [NSLocalizedDescriptionKey : "No data received."]))
                return
            }
            do {
                let decoder = JSONDecoder()
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
                decoder.dateDecodingStrategy = .formatted(formatter)
                let rooms = try decoder.decode([RoomDTO].self, from: data)
                completion(rooms, nil)
            } catch {
                completion(nil, error)
            }
        }
    }
    func getRoomDetail(id: Int, completion: @escaping (Result<RoomDetailResponse, Error>) -> Void) {
           let url = "http://44.202.105.221:8087/room/\(id)?userId=1"
        let token = UserDefaults.standard.string(forKey: "jwtToken") ?? ""
            let headers: HTTPHeaders = [
                "Authorization": "Bearer \(token)",
            ]
           AF.request(url, method: .get, headers: headers).responseDecodable(of: RoomDetailResponse.self) { response in
               switch response.result {
               case .success(let roomDetail):
                   print(roomDetail)
                   completion(.success(roomDetail))
               case .failure(let error):
                   completion(.failure(error))
               }
           }
       }
    
    func bookRoom(parameters: [String: Any], completion: @escaping (Result<Void, Error>) -> Void) {
            let token = UserDefaults.standard.string(forKey: "jwtToken") ?? ""
            let headers: HTTPHeaders = [
                "Authorization": "Bearer \(token)"
            ]

        AF.request("http://44.202.105.221:8087/reservation/add?roomId=303", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
                .validate()
                .response { response in
                    if let error = response.error {
                        completion(.failure(error))
                    } else {
                        completion(.success(()))
                    }
                }
        }
    func getUserReservations(completion: @escaping ([ReservationDTO]?, Error?) -> Void) {
        
        guard let userId = UserDefaults.standard.string(forKey: "userId") else {
            completion(nil, NSError(domain: "", code: 400, userInfo: [NSLocalizedDescriptionKey : "User ID not found in UserDefaults."]))
            return
        }
        
        let token = UserDefaults.standard.string(forKey: "jwtToken") ?? ""
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(token)",
        ]
        
        let urlString = "http://44.202.105.221:8087/reservations?userId=\(userId)"
        
        guard let url = URL(string: urlString) else {
            completion(nil, NSError(domain: "", code: 400, userInfo: [NSLocalizedDescriptionKey : "Invalid URL."]))
            return
        }

        AF.request(url, method: .get, headers: headers).response { response in
            guard let data = response.data else {
                completion(nil, NSError(domain: "", code: 401, userInfo: [NSLocalizedDescriptionKey : "No data received."]))
                return
            }
            do {
                   let decoder = JSONDecoder()
                   let reservations = try decoder.decode([ReservationDTO].self, from: data)
                   completion(reservations, nil)
               } catch {
                   completion(nil, error)
               }
        }
    }

}
