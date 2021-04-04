//
//  CustomButton.swift
//  alcon
//
//  Created by 工藤海斗 on 2021/04/04.
//

import UIKit

class CustomButton: UIButton {
    
    override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: []) {
                    
                    self.transform = .init(scaleX: 0.9, y: 0.9)
                    self.layoutIfNeeded()
                }
            } else {
                UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: []) {
                    
                    self.transform = .identity
                    self.layoutIfNeeded()
                }
            }
        }
    }
    
    init(title: String, titleColor: UIColor = .white, titileFont: UIFont = .systemFont(ofSize: 18), backgroundColor: UIColor = .systemBlue, cornerRadius: CGFloat = 0.0) {
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
        titleLabel?.font = titileFont
        self.backgroundColor = backgroundColor
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
