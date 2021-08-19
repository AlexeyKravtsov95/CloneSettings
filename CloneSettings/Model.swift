//
//  ModelAPI.swift
//  CloneSettings
//
//  Created by a.kravcov on 28.07.2021.
//

import UIKit

struct Model {
    let type: CellType
    let title: String
    var isOn: Bool? = nil
    var descr: String? = nil
    var image: UIImage?
    let color: UIColor?
}

