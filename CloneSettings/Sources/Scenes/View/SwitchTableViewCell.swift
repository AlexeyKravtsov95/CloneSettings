//
//  SwitchTableViewCell.swift
//  CloneSettings
//
//  Created by a.kravcov on 30.07.2021.
//

import Foundation
import UIKit

class SwitchTableViewCell: UITableViewCell {
    
    static let identification = "switchId"
    
    func configure(with model: Model) {
        titleLabel.text = model.title
        icon.image = model.image
        switchControl.isOn = model.isOn ?? false
        containerView.backgroundColor = model.color
    }
    
    public lazy var titleLabel: UILabel = {
        let title = UILabel()
        title.font = .boldSystemFont(ofSize: 17)
        
        return title
    }()
    
    public lazy var icon: UIImageView = {
        let icon = UIImageView()
        icon.contentMode = .scaleAspectFit
        icon.clipsToBounds = true
        icon.tintColor = .white
        
        return icon
    }()
    
    public lazy var containerView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 8
        
        return view
    }()
    
    public lazy var switchControl: UISwitch = {
        let switchControl = UISwitch()
        switchControl.onTintColor = .systemGreen
        
        return switchControl
    }()
    
    private func setupHierarchy() {
        addSubview(titleLabel)
        addSubview(containerView)
        containerView.addSubview(icon)
        addSubview(switchControl)
    }
    
    private func setupLayout() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 55).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        containerView.widthAnchor.constraint(equalToConstant: 32).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        icon.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 3).isActive = true
        icon.widthAnchor.constraint(equalToConstant: 26).isActive = true
        icon.heightAnchor.constraint(equalToConstant: 26).isActive = true
        
        switchControl.translatesAutoresizingMaskIntoConstraints = false
        switchControl.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor).isActive = true
        switchControl.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -22).isActive = true
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
