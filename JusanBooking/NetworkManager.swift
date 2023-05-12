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
    
    func login(email: String, password: String, completion: @escaping (String?, Error?) -> Void) {
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
                        completion(token, nil)
                    } else {
                        let error = NSError(domain: "", code: 401, userInfo: [NSLocalizedDescriptionKey : "Invalid email or password."])
                        completion(nil, error)
                    }
                case .failure(let error):
                    completion(nil, error)
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

    func fetchRooms(token: String, completion: @escaping ([RoomDTO]?, Error?) -> Void) {
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(token)",
            "Accept": "application/json"
        ]
        
        AF.request("http://44.202.105.221:8087/rooms?id=0&email=string", headers: headers).response { response in
            guard let data = response.data else {
                completion(nil, NSError(domain: "", code: 401, userInfo: [NSLocalizedDescriptionKey : "No data received."]))
                return
            }
            do {
                let decoder = JSONDecoder()
                let rooms = try decoder.decode([RoomDTO].self, from: data)
                completion(rooms, nil)
            } catch {
                completion(nil, error)
            }
        }
    }
}
