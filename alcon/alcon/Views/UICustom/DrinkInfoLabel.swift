//
//  DrinkInfoLabel.swift
//  alcon
//
//  Created by 工藤海斗 on 2021/04/03.
//

import UIKit

class DrinkInfoLabel: UILabel {
    
    init(text: String = "", fontSize: CGFloat = 18, font: UIFont = .systemFont(ofSize: 18), color: UIColor = .black, alignment: NSTextAlignment = .center, numberOfLines: Int = 1) {
        super.init(frame: .zero)
        self.text = text
        self.font = font
        textColor = color
        textAlignment = alignment
        self.numberOfLines = numberOfLines
        adjustsFontSizeToFitWidth = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
