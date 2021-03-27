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
        
        let view2 = UIView()
        view2.backgroundColor = .blue
        
        let view3 = UIView()
        view3.backgroundColor = .green
        
        let view4 = UIView()
        view4.backgroundColor = .red
        
        let stackView = UIStackView(arrangedSubviews: [goalView, view2, view3, view4])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        
        self.view.addSubview(stackView)

        [
            goalView.heightAnchor.constraint(equalToConstant: 100),
            view2.heightAnchor.constraint(equalToConstant: 300),
            view3.heightAnchor.constraint(equalToConstant: 50),

            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            stackView.leftAnchor.constraint(equalTo: view.leftAnchor),
            stackView.rightAnchor.constraint(equalTo: view.rightAnchor)].forEach({
                $0.isActive = true
            })
    }
}
