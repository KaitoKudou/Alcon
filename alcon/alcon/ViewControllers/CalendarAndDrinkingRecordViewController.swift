//
//  CalendarAndDrinkingRecordViewController.swift
//  alcon
//
//  Created by 工藤海斗 on 2021/03/26.
//

import RxCocoa
import RxSwift
import UIKit

class CalendarAndDrinkingRecordViewController: UIViewController {

    var addDrinkButton: UIBarButtonItem!
    var shareButton: UIBarButtonItem!
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "カレンダー"
        setupLayout()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        setupLayout()
        setupBindings()
    }
    
    private func setupLayout() {
        addDrinkButton = UIBarButtonItem(image: UIImage(named: "add_drink")?.resize(size: .init(width: 40, height: 40)), style: .plain, target: self, action: nil)
        shareButton = UIBarButtonItem(image: UIImage(named: "share")?.resize(size: .init(width: 45, height: 45)), style: .plain, target: self, action: nil)
        navigationItem.rightBarButtonItem = addDrinkButton
        navigationItem.leftBarButtonItem = shareButton
        
        let goalView = GoalView()
        let calendarView = CalendarView()
        let drinkItemView = DrinkItemView()
        let drinkTableView = DrinkTableView(style: .plain)
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
    
    private func setupBindings() {
        addDrinkButton.rx.tap
            .asDriver()
            .drive { [weak self] _ in
                guard let self = self else { return }
                let drinkRecordVC = DrinkRecordViewController()
                self.navigationController?.pushViewController(drinkRecordVC, animated: true)
            }
            .disposed(by: disposeBag)
        
        shareButton.rx.tap
            .asDriver()
            .drive { [weak self] _ in
                guard self != nil else { return }
                print(#function)
            }
            .disposed(by: disposeBag)
    }
}
