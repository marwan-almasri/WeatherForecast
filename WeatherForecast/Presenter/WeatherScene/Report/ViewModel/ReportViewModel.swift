//
//  ReportViewModel.swift
//  WeatherForecast
//
//  Created by Marwan on 7/5/21.
//

import Foundation

protocol ReportViewModelInput {
}

protocol ReportViewModelOutput {
    var report: Report? { get }
}

protocol ReportViewModel: ReportViewModelInput, ReportViewModelOutput { }

final class DefaultReportViewModel: ReportViewModel {
    
    private let fetchReportUseCase: FetchReportUseCase

    // MARK: - OUTPUT
    var report: Report?
    
    init(fetchReportUseCase: FetchReportUseCase) {
        self.fetchReportUseCase = fetchReportUseCase
    }
}

// MARK: - INPUT. View event methods
extension DefaultReportViewModel {
}
