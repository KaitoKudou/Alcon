//
//  DrinkTableView.swift
//  alcon
//
//  Created by 工藤海斗 on 2021/03/26.
//

import UIKit

class DrinkTableView: UITableView {
    
    var drinkNameArray: [String] = ["ワイン(グラス)", "ビール350ml", "ハイボール"]
    var capacityArray: [Int] = [120, 350, 350]
    var pureAlcoholArray: [Int] = [11, 14, 25]
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: .plain)
        setLayoutTableView()
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
}

extension DrinkTableView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
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
