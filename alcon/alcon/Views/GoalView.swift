//
//  GoalView.swift
//  alcon
//
//  Created by 工藤海斗 on 2021/03/26.
//

import UIKit

class GoalView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(hex: "73AADD")
        setupLabels()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLabels() {
        let titleGoalLabel = DrinkInfoLabel(text: "節酒目標", fontSize: 20, font: .boldSystemFont(ofSize: 20), color: UIColor(hex: "C3E2FF"), alignment: .left)
        addSubview(titleGoalLabel)
        titleGoalLabel.translatesAutoresizingMaskIntoConstraints = false
        titleGoalLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        titleGoalLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        titleGoalLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        
        let goalLabel = DrinkInfoLabel(text: "1日5杯まで", fontSize: 25, font: .boldSystemFont(ofSize: 25), color: UIColor(hex: "F1F8FF"), alignment: .left, numberOfLines: 2)
        addSubview(goalLabel)
        goalLabel.translatesAutoresizingMaskIntoConstraints = false
        goalLabel.topAnchor.constraint(equalTo: titleGoalLabel.bottomAnchor, constant: 5).isActive = true
        goalLabel.leftAnchor.constraint(equalTo: titleGoalLabel.leftAnchor, constant: 10).isActive = true
        goalLabel.rightAnchor.constraint(equalTo: titleGoalLabel.rightAnchor).isActive = true
    }
}
