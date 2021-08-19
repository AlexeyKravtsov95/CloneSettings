//
//  ModelAPI.swift
//  CloneSettings
//
//  Created by a.kravcov on 28.07.2021.
//

import UIKit

struct Settings {
    let type: CellType
    let title: String
    var isOn: Bool? = nil
    var description: String? = nil
    var image: UIImage?
    let color: UIColor?
}

enum CellType {
    case plain
    case description
    case switchControl
}

