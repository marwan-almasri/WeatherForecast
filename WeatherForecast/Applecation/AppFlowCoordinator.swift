//
//  AppFlowCoordinator.swift
//  WeatherForecast
//
//  Created by Marwan on 7/5/21.
//

import UIKit

final class AppFlowCoordinator {

    var navigationController: UINavigationController
    private let appDIContainer: AppDIContainer
    
    init(navigationController: UINavigationController,
         appDIContainer: AppDIContainer) {
        self.navigationController = navigationController
        self.appDIContainer = appDIContainer
    }

    func start() {
        let weatherSceneDIContainer = appDIContainer.makeWeatherSceneDIContainer()
        let flow = weatherSceneDIContainer.makeWeatherReportFlowCoordinator(navigationController: navigationController)
        flow.start()
    }
}
