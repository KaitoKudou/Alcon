//
//  CalendarAndDrinkingRecordViewController.swift
//  alcon
//
//  Created by 工藤海斗 on 2021/03/26.
//

import UIKit

class CalendarAndDrinkingRecordViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        navigationItem.title = "カレンダー"
        print("CalendarAndDrinkingRecordViewController")
        
        let goalView = GoalView()
        let calendarView = CalendarView()
        let drinkItemView = DrinkItemView()
        
        let view4 = UIView()
        view4.backgroundColor = .red
        
        let stackView = UIStackView(arrangedSubviews: [goalView, calendarView, drinkItemView, view4])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        
        self.view.addSubview(stackView)

        [
            goalView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1, constant: 40),
            calendarView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4, constant: 30),
            drinkItemView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1, constant: -20),

            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            stackView.leftAnchor.constraint(equalTo: view.leftAnchor),
            stackView.rightAnchor.constraint(equalTo: view.rightAnchor)].forEach({
                $0.isActive = true
            })
    }
}
