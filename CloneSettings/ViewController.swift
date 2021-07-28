//
//  ViewController.swift
//  CloneSettings
//
//  Created by a.kravcov on 26.07.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {
    
    let data = [
        "Section0": [Model(title: "Авиарежим",
                           image: UIImage(systemName: "airplane")),
                     Model(title: "Wi-Fi",
                           image: UIImage(systemName: "wifi")),
                     Model(title: "Bluetooth",
                           image: UIImage(named: "bluetooth")),
                     Model(title: "Сотовая связь", image: UIImage(systemName: "antenna.radiowaves.left.and.right")),
                     Model(title: "Режим модема",
                           image: UIImage(systemName: "personalhotspot")),
                     Model(title: "VPN",
                           image: UIImage(systemName: "globe"))],
        "Section1": [Model(title: "Уведомления",
                           image: UIImage(systemName: "note")),
                     Model(title: "Звук, тактильные сигналы",
                           image: UIImage(systemName: "speaker.wave.3.fill")),
                     Model(title: "Не беспокоить",
                           image: UIImage(systemName: "moon.fill")),
                     Model(title: "Экранное время",
                           image: UIImage(systemName: "hourglass"))],
        "Section2": [Model(title: "Основные",
                           image: UIImage(systemName: "gear")),
                     Model(title: "Пункт управления",
                           image: UIImage(systemName: "slider.horizontal.3")),
                     Model(title: "Экран и яркость",
                           image: UIImage(systemName: "textformat.size")),
                     Model(title: "Экран \"Домой\"",
                           image: UIImage(systemName: "apps.iphone")),
                     Model(title: "Универсальный доступ",
                           image: UIImage(systemName: "figure.stand")),
                     Model(title: "Обои",
                           image: UIImage(systemName: "seal")),
                     Model(title: "Siri и Поиск",
                           image: UIImage(named: "siri")),
                     Model(title: "Face ID и код-пароль",
                           image: UIImage(systemName: "person.fill.viewfinder")),
                     Model(title: "Аккумулятор",
                           image: UIImage(systemName: "battery.100")),
                     Model(title: "Конфиденциальность",
                           image: UIImage(systemName: "hand.raised.fill"))]
    ]
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identification)
        
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
        data.keys.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data["Section\(section)"]?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identification, for: indexPath) as? TableViewCell else { return UITableViewCell() }
        cell.titleLabel.text = data["Section\(indexPath.section)"]?[indexPath.row].title
        cell.icon.image = data["Section\(indexPath.section)"]?[indexPath.row].image
        
        return cell
    }
}
