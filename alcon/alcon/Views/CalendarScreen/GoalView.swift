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
        let titleGoalLabel = DrinkInfoLabel(text: "節酒目標", font: .boldSystemFont(ofSize: 20), color: UIColor(hex: "C3E2FF"), alignment: .left)
        addSubview(titleGoalLabel)
        titleGoalLabel.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor, topPadding: 10, leftPadding: 10)
        
        let goalLabel = DrinkInfoLabel(text: "1日5杯までああああああああああああああああああああ", font: .boldSystemFont(ofSize: 20), color: UIColor(hex: "F1F8FF"), alignment: .left, numberOfLines: 2)
        addSubview(goalLabel)
        goalLabel.anchor(top: titleGoalLabel.bottomAnchor, left: titleGoalLabel.leftAnchor, right: titleGoalLabel.rightAnchor, topPadding: 5, leftPadding: 10)
    }
}
