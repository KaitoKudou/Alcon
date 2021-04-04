//
//  CustomTextView.swift
//  alcon
//
//  Created by 工藤海斗 on 2021/04/04.
//

import UIKit

class CustomTextView: UITextView {
    init(backgroundColor: UIColor = .white, font: UIFont = .systemFont(ofSize: 18), borderColor: CGColor = UIColor.clear.cgColor, borderWidth: CGFloat = 0.0, cornerRadius: CGFloat = 0.0) {
        super.init(frame: .zero, textContainer: .none)
        self.backgroundColor = backgroundColor
        self.font = font
        layer.borderColor = borderColor
        layer.borderWidth = borderWidth
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
