//
//  ViewController.swift
//  CloneSettings
//
//  Created by a.kravcov on 26.07.2021.
//

import UIKit

class SettingsController: UIViewController {
    
    private var settingsView: SettingsView? {
        guard isViewLoaded else { return nil }
        return view as? SettingsView
    }
    
    var model: SettingsModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Настройки"

        view = SettingsView()
        model = SettingsModel()
        configureView()
    }
}

//MARK: - Configuration

private extension SettingsController {
    func configureView() {
        guard let models = model?.createModel() else {
            return
        }
        settingsView?.configureView(with: models)
    }
}
