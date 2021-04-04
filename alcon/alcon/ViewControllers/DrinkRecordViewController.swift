//
//  DrinkRecordViewController.swift
//  alcon
//
//  Created by 工藤海斗 on 2021/04/03.
//

import UIKit

class DrinkRecordViewController: UIViewController {
    
    var drinkTableView: UITableView = UITableView(frame: .zero, style: .plain)
    var drinkNameArray: [String] = ["ビール", "ビール(中)", "ビール", "チューハイ", "ハイボール", "ハイボール", "ワイン", "日本酒(1合)", "日本酒(おちょこ)", "焼酎", "ウイスキー"]
    var capacityArray: [Int] = [350, 400, 500, 350, 350, 500, 120, 180, 30, 100, 30]
    var pureAlcoholArray: [Int] = [14, 16, 20, 14, 20, 28, 12, 22, 4, 20, 10]
    let drinkItemView = DrinkItemView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "記録"
        view.addSubview(drinkItemView)
        view.addSubview(drinkTableView)
        setLayoutTableView()
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
        return drinkNameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! DrinkTableViewCell
        cell.backgroundColor = UIColor(hex: "E0E0E0")
        cell.setCell(drinkName: drinkNameArray[indexPath.row], capacity: capacityArray[indexPath.row
        ], pureAlcohol: pureAlcoholArray[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}
