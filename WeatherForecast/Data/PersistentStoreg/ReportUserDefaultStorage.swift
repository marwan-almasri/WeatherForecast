//
//  ReportUserDefaultStorage.swift
//  WeatherForecast
//
//  Created by Marwan on 7/1/21.
//

import Foundation

enum ReportUserDefaultStorageError: Error {
    case notFound
}

final class ReportUserDefaultStorage {

    private let storage: UserDefaults
    
    private var storageKey: String

    init(storage: UserDefaults = UserDefaults.standard, storageKey: String = "WEATHER-REPORT") {
        self.storage = storage
        self.storageKey = storageKey
    }
}

extension ReportUserDefaultStorage: ReportResponseStorage {
    
    func get(completion: @escaping (Result<ReportDTO?, Error>) -> Void) {
        
        guard let data = storage.object(forKey: self.storageKey) as? Data else {
            completion(.success(nil))
            return
        }
        
        do {
            let response = try JSONDecoder().decode(ReportDTO.self, from: data)
            completion(.success(response))
        } catch {
            completion(.failure(error))
        }
    }
    
    func set(_ object: ReportDTO, completion: @escaping (Result<Void, Error>) -> Void) {
        
        do {
            let data = try JSONEncoder().encode(object)
            storage.set(data, forKey: self.storageKey)
            storage.synchronize()
            completion(.success(()))
        } catch {
            completion(.failure(error))
        }
    }
    
    func clear(completion: @escaping (Result<Void, Error>) -> Void) {
        storage.removeObject(forKey: self.storageKey)
        storage.synchronize()
        completion(.success(()))
    }
}
