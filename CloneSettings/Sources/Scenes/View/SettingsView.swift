//
//  SettingsView.swift
//  CloneSettings
//
//  Created by a.kravcov on 19.08.2021.
//

import UIKit

class SettingsView: UIView, UITableViewDelegate {
    
    func configureView(with models: [String :[Settings]]) {
        self.models = models
    }
    
    //MARK: - Private properties
    
    private var models = [String:[Settings]]()
    
    //MARK: - Views
    
    private lazy var tableView: UITableView = {

        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(SettingsContentViewCell.self, forCellReuseIdentifier: SettingsContentViewCell.identification)
        tableView.register(SettingsContentSwitchViewCell.self, forCellReuseIdentifier: SettingsContentSwitchViewCell.identification)
        tableView.register(SettingsContentDescriptionViewCell.self, forCellReuseIdentifier: SettingsContentDescriptionViewCell.identification)
        tableView.dataSource = self
        tableView.delegate = self

        
        return tableView
    }()
    
    //MARK: - Initial
    
    init() {
        super.init(frame: .zero)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = .white
        setupHierarchy()
        setupLayout()
    }
    
    private func setupHierarchy() {
        addSubview(tableView)
    }

    private func setupLayout() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}

extension SettingsView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.keys.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models["Section\(section)"]?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let data = models["Section\(indexPath.section)"]?[indexPath.row] else {
            return UITableViewCell()
        }
        
        switch data.type {
        case .plain:
            return setupPlainCell(for: indexPath, with: data)
        case .description:
            return setupDescriptionCell(for: indexPath, with: data)
        case .switchControl:
            return setupSwitchCell(for: indexPath, with: data)
        }
    }
    
    private func setupPlainCell(for indexPath: IndexPath, with data: Settings) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingsContentViewCell.identification, for: indexPath) as? SettingsContentViewCell else { return UITableViewCell() }
        cell.titleLabel.text = data.title
        cell.icon.image = data.image
        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        cell.containerView.backgroundColor = data.color
        
        return cell
    }
    
    private func setupDescriptionCell(for indexPath: IndexPath, with data: Settings) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingsContentDescriptionViewCell.identification, for: indexPath) as? SettingsContentDescriptionViewCell else { return UITableViewCell() }
        cell.titleLabel.text = data.title
        cell.icon.image = data.image
        cell.descriptionLabel.text = data.description
        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        cell.containerView.backgroundColor = data.color

        return cell
    }
    
    private func setupSwitchCell(for indexPath: IndexPath, with data: Settings) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingsContentSwitchViewCell.identification, for: indexPath) as? SettingsContentSwitchViewCell else { return UITableViewCell() }
        cell.titleLabel.text = data.title
        cell.icon.image = data.image
        cell.switchControl.isOn = data.isOn!
        cell.containerView.backgroundColor = data.color
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let data = models["Section\(indexPath.section)"]?[indexPath.row]{
            print("Нажата ячейка \(data.title)")
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
}
