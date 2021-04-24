//
//  DrinkTableView.swift
//  alcon
//
//  Created by 工藤海斗 on 2021/03/26.
//

import UIKit

class DrinkTableView: UITableView {
    
    private var drinkTableViewModel: DrinkTableViewModel!
    private let userDefaults = UserDefaults()
    private let dateKey: String = "date"
    var drinks = [Drinks]() // 日付ごとのお酒
    
    init(style: UITableView.Style) {
        super.init(frame: .zero, style: .plain)
        drinkTableViewModel = DrinkTableViewModel()
        let date = userDefaults.string(forKey: dateKey) ?? ""
        drinkTableViewModel.fetchDailyDrinkList(date: date, completion: { [weak self] (drinks) in
            guard self != nil else { return }
            self?.drinks = drinks
            self?.reloadData()
            
        })
        setLayoutTableView()
        NotificationCenter.default.addObserver(self, selector: #selector(updateDailyDrinkList(notification:)), name: .applyDrink, object: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayoutTableView() {
        backgroundColor = UIColor(hex: "E0E0E0")
        anchor(top: topAnchor, bottom: bottomAnchor, left: leftAnchor, right: rightAnchor)
        register(DrinkTableViewCell.self, forCellReuseIdentifier: "cell")
        delegate = self
        dataSource = self
    }
    
    @objc func updateDailyDrinkList(notification: NSNotification?) {
        let drinks = notification?.userInfo!["drinks"]
        self.drinks = drinks as? [Drinks] ?? [Drinks]()
        reloadData()
    }
}

extension DrinkTableView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return drinks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! DrinkTableViewCell
        cell.backgroundColor = UIColor(hex: "E0E0E0")
        cell.setCell(drinkName: drinks[indexPath.row].type ?? "", capacity: drinks[indexPath.row
        ].capacity ?? 0, pureAlcohol: drinks[indexPath.row].pureAlcohol ?? 0)
        return cell
    }
    
    // TableViewCellの高さ
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    // TableViewCellの編集許可
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // TableViewCellをスワイプで削除
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let date = userDefaults.string(forKey: dateKey) ?? ""
        if editingStyle == UITableViewCell.EditingStyle.delete {
            drinkTableViewModel.deleteDailyDrinkList(date: date, drinks: drinks[indexPath.row])
            drinks.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}
