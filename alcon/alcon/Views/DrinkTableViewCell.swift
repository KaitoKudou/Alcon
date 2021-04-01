//
//  DrinkTableViewCell.swift
//  alcon
//
//  Created by 工藤海斗 on 2021/04/02.
//

import UIKit

class DrinkTableViewCell: UITableViewCell {
    
    let drinkNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = UIColor.black
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    let capacityLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    let amountPureAlcoholLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
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
        //itemStackView.spacing = 10
        addSubview(itemStackView)
        
        itemStackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        itemStackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        itemStackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        itemStackView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
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
