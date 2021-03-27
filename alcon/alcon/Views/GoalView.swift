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
        let titleGoalLabel = UILabel()
        titleGoalLabel.text = "節酒目標"
        titleGoalLabel.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 20)
        titleGoalLabel.textColor = UIColor(hex: "C3E2FF")
        addSubview(titleGoalLabel)
        titleGoalLabel.translatesAutoresizingMaskIntoConstraints = false
        titleGoalLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        titleGoalLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        titleGoalLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        
        let goalLabel = UILabel()
        goalLabel.text = "1日5杯まで"
        goalLabel.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 25)
        goalLabel.textAlignment = .left
        goalLabel.numberOfLines = 0
        goalLabel.textColor = UIColor(hex: "F1F8FF")
        addSubview(goalLabel)
        goalLabel.translatesAutoresizingMaskIntoConstraints = false
        goalLabel.topAnchor.constraint(equalTo: titleGoalLabel.bottomAnchor, constant: 5).isActive = true
        goalLabel.leftAnchor.constraint(equalTo: titleGoalLabel.leftAnchor, constant: 10).isActive = true
        goalLabel.rightAnchor.constraint(equalTo: titleGoalLabel.rightAnchor).isActive = true
    }
}
