//
//  FetchReportUseCase.swift
//  WeatherForecast
//
//  Created by Marwan on 7/5/21.
//

import Foundation

protocol FetchReportUseCase {
    func execute(requestValue: FetchReportUseCaseRequestValue,
                 cached: @escaping (Report?) -> Void,
                 completion: @escaping (Result<Report, Error>) -> Void)
}

final class DefaultFetchReportUseCase: FetchReportUseCase {

    private let reportRepository: ReportRepository

    init(reportRepository: ReportRepository) {

        self.reportRepository = reportRepository
    }

    func execute(requestValue: FetchReportUseCaseRequestValue,
                 cached: @escaping (Report?) -> Void,
                 completion: @escaping (Result<Report, Error>) -> Void) {

        return reportRepository.fetch(for: requestValue.city,
                                      in: requestValue.unit,
                                      cached: cached,
                                      completion: completion)
    }
}

struct FetchReportUseCaseRequestValue {
    let city: String?
    let unit: Unit
}
