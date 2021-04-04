//
//  GoalChangeViewController.swift
//  alcon
//
//  Created by 工藤海斗 on 2021/04/04.
//

import RxCocoa
import RxSwift
import UIKit

class GoalChangeViewController: UIViewController {
    
    var characterCountLabel: UILabel!
    var goalTextView: UITextView!
    var goalStorageButton: UIButton!
    private let disposeBag = DisposeBag()
    private let maxLength: Int = 30
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "目標変更"
        characterCountLabel = DrinkInfoLabel(text: "0/\(maxLength)", fontSize: 20, alignment: .left)
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
        
        setBindings()
    }
    
    //入力画面またはkeyboardの外を押したら、キーボードを閉じる処理
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (goalTextView.isFirstResponder) {
            goalTextView.resignFirstResponder()
        }
    }
    
    private func setBindings() {
        goalTextView.rx.text
            .asDriver()
            .drive { [weak self] (text) in
                guard let self = self else { return }
                if let text = text, text.count >= self.maxLength {
                    self.characterCountLabel.text = "\(text.count)/30"
                    self.goalTextView.textColor = .red
                    self.characterCountLabel.textColor = .red
                } else {
                    self.goalTextView.textColor = .black
                    self.characterCountLabel.textColor = .black
                }
                
                let inputTextLength = self.goalTextView.text.count
                self.characterCountLabel.text = "\(inputTextLength)/30"
                
                if inputTextLength <= 30 {
                    self.goalStorageButton.isEnabled = true
                    self.goalStorageButton.backgroundColor = UIColor(hex: "C3E2FF")
                    self.goalStorageButton.setTitleColor(UIColor(hex: "73AADD"), for: .normal)
                } else {
                    self.goalStorageButton.isEnabled = false
                    self.goalStorageButton.backgroundColor = UIColor(hex: "F2F2F7")
                    self.goalStorageButton.setTitleColor(UIColor(hex: "B2B2B2"), for: .normal)
                }
            }
            .disposed(by: disposeBag)
        
        goalStorageButton.rx.tap
            .asDriver()
            .drive { [weak self] _ in
                guard let self = self else { return }
                self.navigationController?.popViewController(animated: true)
            }
            .disposed(by: disposeBag)
    }
}
