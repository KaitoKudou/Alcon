//
//  CalendarAndDrinkingRecordViewController.swift
//  alcon
//
//  Created by 工藤海斗 on 2021/03/26.
//

import UIKit

class CalendarAndDrinkingRecordViewController: UIViewController {

    var addDrinkButton: UIBarButtonItem!
    var shareButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        navigationItem.title = "カレンダー"

        print("CalendarAndDrinkingRecordViewController")
        addDrinkButton = UIBarButtonItem(image: UIImage(named: "add_drink")?.resize(size: .init(width: 40, height: 40)), style: .plain, target: self, action: #selector(toDrinkRecord))
        shareButton = UIBarButtonItem(image: UIImage(named: "share")?.resize(size: .init(width: 45, height: 45)), style: .plain, target: self, action: #selector(toDrinkRecord))
        navigationItem.rightBarButtonItem = addDrinkButton
        navigationItem.leftBarButtonItem = shareButton

        let goalView = GoalView()
        let calendarView = CalendarView()
        let drinkItemView = DrinkItemView()
        let drinkTableView = DrinkTableView()
        
        let stackView = UIStackView(arrangedSubviews: [goalView, calendarView, drinkItemView, drinkTableView])
        stackView.axis = .vertical
        
        self.view.addSubview(stackView)
        stackView.anchor(top: view.safeAreaLayoutGuide.topAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor)
        [
            goalView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1, constant: 40),
            calendarView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4, constant: 30),
            drinkItemView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1, constant: -20),].forEach({
                $0.isActive = true
            })
    }
    
    @objc func toDrinkRecord() {
        print(#function)
        let drinkRecordVC = DrinkRecordViewController()
        navigationController?.pushViewController(drinkRecordVC, animated: true)
    }
}
