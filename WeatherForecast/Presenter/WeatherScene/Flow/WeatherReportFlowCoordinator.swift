//
//  WeatherReportFlowCoordinator.swift
//  WeatherForecast
//
//  Created by Marwan on 7/5/21.
//

import UIKit

protocol WeatherReportFlowCoordinatorDependencies {
    func makeReportViewController() -> ReportViewController
}

final class WeatherReportFlowCoordinator {
    
    private weak var navigationController: UINavigationController?
    private let dependencies: WeatherReportFlowCoordinatorDependencies

    private weak var reportVC: ReportViewController?
    private weak var moviesQueriesSuggestionsVC: UIViewController?

    init(navigationController: UINavigationController,
         dependencies: WeatherReportFlowCoordinatorDependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    func start() {
        let vc = dependencies.makeReportViewController()
        navigationController?.pushViewController(vc, animated: false)
        reportVC = vc
    }
}
