//
//  Data.swift
//  CloneSettings
//
//  Created by a.kravcov on 29.07.2021.
//

import Foundation
import UIKit

class Data {
    
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
                           image: UIImage(systemName: "hand.raised.fill"))]]
}
