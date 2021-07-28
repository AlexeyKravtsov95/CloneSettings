//
//  TableViewCell.swift
//  CloneSettings
//
//  Created by a.kravcov on 28.07.2021.
//

import Foundation
import UIKit

class TableViewCell: UITableViewCell {
    
    static let identification = "id"
    
    func configure(with title: String) {
        titleLabel.text = title
    }
    
    public lazy var titleLabel: UILabel = {
        let title = UILabel()
        title.font = .boldSystemFont(ofSize: 17)
        
        return title
    }()
    
    private func setupHierarchy() {
        addSubview(titleLabel)
    }
    
    private func setupLayout() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 64).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupHierarchy()
        setupLayout()
    }
}
