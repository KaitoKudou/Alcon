//
//  DrinkTableView.swift
//  alcon
//
//  Created by 工藤海斗 on 2021/03/26.
//

import UIKit

class DrinkTableView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setTableView() {
        var drinkTableView: UITableView = UITableView()
        drinkTableView.backgroundColor = UIColor(hex: "E0E0E0")
        addSubview(drinkTableView)
        drinkTableView.translatesAutoresizingMaskIntoConstraints = false
        drinkTableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        drinkTableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        drinkTableView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        drinkTableView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
    }
}
