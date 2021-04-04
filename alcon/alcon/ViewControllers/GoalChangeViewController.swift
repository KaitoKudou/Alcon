//
//  GoalChangeViewController.swift
//  alcon
//
//  Created by 工藤海斗 on 2021/04/04.
//

import UIKit

class GoalChangeViewController: UIViewController {
    
    var characterCountLabel: UILabel!
    var goalTextView: UITextView!
    var goalStorageButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "目標変更"
        characterCountLabel = DrinkInfoLabel(text: "30/30", fontSize: 20, alignment: .left)
        goalTextView = CustomTextView(backgroundColor: UIColor(hex: "F2F2F7"), font: UIFont.systemFont(ofSize: 20), borderColor: UIColor(hex: "D0D0D1").cgColor, borderWidth: 1.0, cornerRadius: 10.0)
        goalStorageButton = CustomButton(title: "保存", titleColor: UIColor(hex: "73AADD"), titileFont: UIFont.boldSystemFont(ofSize: 20), backgroundColor: UIColor(hex: "C3E2FF"), cornerRadius: 10)
        
        view.addSubview(characterCountLabel)
        view.addSubview(goalTextView)
        view.addSubview(goalStorageButton)
        characterCountLabel.anchor(top: view.topAnchor, left: view.leftAnchor, topPadding: 20, leftPadding: 20)
        goalTextView.translatesAutoresizingMaskIntoConstraints = false
        goalTextView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2).isActive = true
        goalTextView.anchor(top: characterCountLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor,topPadding: 20, leftPadding: 20, rightPadding: 20)
        goalStorageButton.anchor(bottom: view.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, height: view.bounds.height * 0.1 - 30, bottomPadding: 20, leftPadding: 20, rightPadding: 20)
    }
}
