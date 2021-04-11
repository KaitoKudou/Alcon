//
//  DrinkRecordViewController.swift
//  alcon
//
//  Created by 工藤海斗 on 2021/04/03.
//

import UIKit

class DrinkRecordViewController: UIViewController {
    
    var drinkTableView: UITableView = UITableView(frame: .zero, style: .plain)
    let drinkItemView = DrinkItemView()
    let drinkRecordViewModel = DrinkRecordViewModel()
    var drinks = [Drinks]() // お酒一覧
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "記録"
        view.addSubview(drinkItemView)
        view.addSubview(drinkTableView)
        setLayoutTableView()
        
        self.drinkRecordViewModel.fetchDrinkLists { (drinks) in
            self.drinks = drinks
            self.drinkTableView.reloadData()
        }
    }
    
    private func setLayoutTableView() {
        drinkTableView.delegate = self
        drinkTableView.dataSource = self
        drinkTableView.backgroundColor = UIColor(hex: "E0E0E0")
        drinkTableView.register(DrinkTableViewCell.self, forCellReuseIdentifier: "cell")
        drinkItemView.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor)
        drinkItemView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1, constant: -20).isActive = true
        drinkTableView.anchor(top: drinkItemView.bottomAnchor, bottom: view.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor)
    }
}

extension DrinkRecordViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return drinks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! DrinkTableViewCell
        cell.backgroundColor = UIColor(hex: "E0E0E0")
        cell.setCell(drinkName: drinks[indexPath.row].type ?? "", capacity: drinks[indexPath.row].capacity ?? 0, pureAlcohol: drinks[indexPath.row].pureAlcohol ?? 0)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}
