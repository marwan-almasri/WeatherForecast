//
//  AppDIContainer.swift
//  WeatherForecast
//
//  Created by Marwan on 7/5/21.
//

import Foundation

final class AppDIContainer {
    
    lazy var appConfiguration = AppConfiguration()
    
    // MARK: - Network
    lazy var networkService: NetworkService = {
        return DefaultNetworkService()
    }()
    
    // MARK: - DIContainers of scenes
    func makeWeatherSceneDIContainer() -> WeatherSceneDIContainer {
        let dependencies = WeatherSceneDIContainer.Dependencies(networkService: networkService)
        return WeatherSceneDIContainer(dependencies: dependencies)
    }
    
}
