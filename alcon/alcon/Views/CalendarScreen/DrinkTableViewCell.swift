//
//  DrinkTableViewCell.swift
//  alcon
//
//  Created by 工藤海斗 on 2021/04/02.
//

import UIKit

class DrinkTableViewCell: UITableViewCell {
    
    private let drinkNameLabel = DrinkInfoLabel(fontSize: 18, color: UIColor(light: .black, dark: .white), alignment: .left)
    private let capacityLabel = DrinkInfoLabel(fontSize: 18, color: UIColor(light: .black, dark: .white), alignment: .center)
    private let amountPureAlcoholLabel = DrinkInfoLabel(fontSize: 18, color: UIColor(light: .black, dark: .white), alignment: .center)
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
        addSubview(drinkNameLabel)
        addSubview(capacityLabel)
        addSubview(amountPureAlcoholLabel)
        let itemStackView = UIStackView(arrangedSubviews: [drinkNameLabel, capacityLabel, amountPureAlcoholLabel])
        itemStackView.translatesAutoresizingMaskIntoConstraints = false
        itemStackView.axis = .horizontal
        itemStackView.distribution = .fillEqually
        addSubview(itemStackView)
        
        itemStackView.anchor(top: topAnchor, bottom: bottomAnchor, left: leftAnchor, right: rightAnchor, leftPadding: 20)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setCell(drinkName: String, capacity: Int, pureAlcohol: Int) {
        drinkNameLabel.text = drinkName
        capacityLabel.text = "\(String(capacity))ml"
        amountPureAlcoholLabel.text = "\(String(pureAlcohol))g"
    }
}
