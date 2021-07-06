//
//  ReportViewController.swift
//  WeatherForecast
//
//  Created by Marwan on 7/5/21.
//

import UIKit

class ReportViewController: UIViewController, StoryboardInstantiable {
    
    // MARK: - Lifecycle

    private var viewModel: ReportViewModel!
    
    static func create(with viewModel: ReportViewModel) -> ReportViewController {
        let view = ReportViewController.instantiateViewController()
        view.viewModel = viewModel
        return view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        bind(to: viewModel)
    }

    private func bind(to viewModel: ReportViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: - Private

    private func setupViews() {
        
    }
}
