//
//  ViewController.swift
//  CloneSettings
//
//  Created by a.kravcov on 26.07.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {
    
    private let modelData = SettingsModel().data
    
    private lazy var tableView: UITableView = {

        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identification)
        tableView.register(SwitchTableViewCell.self, forCellReuseIdentifier: SwitchTableViewCell.identification)
        tableView.register(DescriptionTableViewCell.self, forCellReuseIdentifier: DescriptionTableViewCell.identification)
        tableView.dataSource = self
        tableView.delegate = self

        
        return tableView
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("test", for: .normal)
        button.backgroundColor = .white
        button.setImage(UIImage(named: "bluetooth"), for: .normal)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupLayout()
        navigationItem.title = "Настройки"

        view.backgroundColor = .white
    }
    
    private func setupHierarchy() {
        view.addSubview(tableView)
    }

    private func setupLayout() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        modelData.keys.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        modelData["Section\(section)"]?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let data = modelData["Section\(indexPath.section)"]?[indexPath.row] else {
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identification, for: indexPath) as? TableViewCell else { return UITableViewCell() }
        cell.titleLabel.text = data.title
        cell.icon.image = data.image
        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        cell.containerView.backgroundColor = data.color
        
        return cell
    }
    
    private func setupDescriptionCell(for indexPath: IndexPath, with data: Settings) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DescriptionTableViewCell.identification, for: indexPath) as? DescriptionTableViewCell else { return UITableViewCell() }
        cell.titleLabel.text = data.title
        cell.icon.image = data.image
        cell.descriptionLabel.text = data.description
        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        cell.containerView.backgroundColor = data.color

        return cell
    }
    
    private func setupSwitchCell(for indexPath: IndexPath, with data: Settings) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SwitchTableViewCell.identification, for: indexPath) as? SwitchTableViewCell else { return UITableViewCell() }
        cell.titleLabel.text = data.title
        cell.icon.image = data.image
        cell.switchControl.isOn = data.isOn!
        cell.containerView.backgroundColor = data.color
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let data = modelData["Section\(indexPath.section)"]?[indexPath.row]{
            print("Нажата ячейка \(data.title)")
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
}
