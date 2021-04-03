//
//  DrinkTableItemView.swift
//  alcon
//
//  Created by 工藤海斗 on 2021/03/26.
//

import UIKit

class DrinkItemView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(hex: "73AADD")
        setupLabels()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLabels() {
        let itemLabel = DrinkInfoLabel(text: "内容", fontSize: 18, color: .white, alignment: .left)
        let capacityLabel = DrinkInfoLabel(text: "容量", fontSize: 18, color: .white, alignment: .center)
        let pureAlcoholLabel = DrinkInfoLabel(text: "純アルコール量", fontSize: 18, color: .white, alignment: .right)
        
        let itemStackView = UIStackView(arrangedSubviews: [itemLabel, capacityLabel, pureAlcoholLabel])
        itemStackView.translatesAutoresizingMaskIntoConstraints = false
        itemStackView.axis = .horizontal
        itemStackView.distribution = .fillEqually
        itemStackView.spacing = 10
        addSubview(itemStackView)
        
        itemStackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        itemStackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        itemStackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        itemStackView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
}
