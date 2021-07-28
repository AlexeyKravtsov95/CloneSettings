//
//  ViewController.swift
//  CloneSettings
//
//  Created by a.kravcov on 26.07.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {
    
    let data = [
        "Section0": [Model(title: "Авиарежим"), Model(title: "Wi-Fi"), Model(title: "Bluetooth"), Model(title: "Сотовая связь"), Model(title: "Режим модема"), Model(title: "VPN")],
        "Section1": [Model(title: "Уведомления"), Model(title: "Звук, тактильные сигналы"), Model(title: "Не беспокоить"), Model(title: "Экранное время")],
        "Section2": [Model(title: "Основные"), Model(title: "Пункт управления"), Model(title: "Экран и яркость"), Model(title: "Экран \"Домой\""), Model(title: "Универсальный доступ"), Model(title: "Обои"), Model(title: "Siri и Поиск"), Model(title: "Face ID и код-пароль"), Model(title: "Экстренный вызов - SOS"), Model(title: "Уведомления о контакте"), Model(title: "Аккумулятор"), Model(title: "Конфиденциальность")]
    ]
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identification)
        
        return tableView
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
        data.keys.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data["Section\(section)"]?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identification, for: indexPath) as? TableViewCell else { return UITableViewCell() }
        cell.titleLabel.text = data["Section\(indexPath.section)"]?[indexPath.row].title

        return cell
    }
}
