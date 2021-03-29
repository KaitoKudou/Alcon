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
        let itemLabel = UILabel()
        itemLabel.text = "内容"
        itemLabel.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 18)
        itemLabel.adjustsFontSizeToFitWidth = true
        itemLabel.textAlignment = .left
        itemLabel.textColor = UIColor.white
        
        let capacityLabel = UILabel()
        capacityLabel.text = "容量"
        capacityLabel.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 18)
        capacityLabel.adjustsFontSizeToFitWidth = true
        capacityLabel.textAlignment = .left
        capacityLabel.textColor = UIColor.white
        
        let pureAlcoholLabel = UILabel()
        pureAlcoholLabel.text = "純アルコール量"
        pureAlcoholLabel.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 18)
        pureAlcoholLabel.adjustsFontSizeToFitWidth = true
        pureAlcoholLabel.textAlignment = .left
        pureAlcoholLabel.textColor = UIColor.white
        
        let itemStackView = UIStackView(arrangedSubviews: [itemLabel, capacityLabel, pureAlcoholLabel])
        itemStackView.translatesAutoresizingMaskIntoConstraints = false
        itemStackView.axis = .horizontal
        itemStackView.distribution = .fillEqually
        itemStackView.spacing = 10
        addSubview(itemStackView)
        
        itemStackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        itemStackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        itemStackView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        itemStackView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
}
