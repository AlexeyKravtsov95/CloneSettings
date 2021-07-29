//
//  ViewController.swift
//  CloneSettings
//
//  Created by a.kravcov on 26.07.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {
    
    private let modelData = Data().data
    
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
        modelData.keys.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        modelData["Section\(section)"]?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identification, for: indexPath) as? TableViewCell else { return UITableViewCell() }
        cell.titleLabel.text = modelData["Section\(indexPath.section)"]?[indexPath.row].title
        cell.icon.image = modelData["Section\(indexPath.section)"]?[indexPath.row].image
        
        return cell
    }
}
