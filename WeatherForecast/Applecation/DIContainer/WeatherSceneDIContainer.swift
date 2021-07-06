//
//  WeatherSceneDIContainer.swift
//  WeatherForecast
//
//  Created by Marwan on 7/5/21.
//

import UIKit
import SwiftUI

final class WeatherSceneDIContainer {
    
    struct Dependencies {
        let networkService: NetworkService
    }
    
    private let dependencies: Dependencies
    
    // MARK: - Persistent Storage
    lazy var reportResponseCache: ReportResponseStorage = ReportUserDefaultStorage()
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    // MARK: - Repositories
    func makeReportRepository() -> ReportRepository {
        return DefaultReportRepository(network: dependencies.networkService, cache: reportResponseCache)
    }
    
    // MARK: - Use Cases
    func makeFetchReportUseCase() -> FetchReportUseCase {
        return DefaultFetchReportUseCase(reportRepository: makeReportRepository())
    }
    
    // MARK: - Weather Report
    func makeReportViewController() -> ReportViewController {
        return ReportViewController.create(with: makeReportViewModel())
    }
    
    func makeReportViewModel() -> ReportViewModel {
        return DefaultReportViewModel(fetchReportUseCase: makeFetchReportUseCase())
    }
    
    // MARK: - Flow Coordinators
    func makeWeatherReportFlowCoordinator(navigationController: UINavigationController) -> WeatherReportFlowCoordinator {
        return WeatherReportFlowCoordinator(navigationController: navigationController,
                                           dependencies: self)
    }
}

extension WeatherSceneDIContainer: WeatherReportFlowCoordinatorDependencies {}
