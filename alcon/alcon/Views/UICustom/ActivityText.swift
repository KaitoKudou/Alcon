//
//  ActivityText.swift
//  alcon
//
//  Created by 工藤海斗 on 2021/04/25.
//

import UIKit

class ActivityText: NSObject, UIActivityItemSource {
    
    private var text = ""
    private let userDefaults = UserDefaults()
    private let goalKey: String = "goal"
    private let dateKey: String = "date"
    private var drinkTableViewModel: DrinkTableViewModel!
    private var drinks = [Drinks]() // 日付ごとのお酒
    
    override init() {
        super.init()
        let goal = userDefaults.string(forKey: goalKey)
        let date = userDefaults.string(forKey: dateKey)
        text = "節酒目標：\(goal ?? "")\n\(date ?? "")の飲酒記録\n"
        drinkTableViewModel = DrinkTableViewModel()
        
        drinkTableViewModel.fetchDailyDrinkList(date: date ?? "", completion: { [weak self] (drinks) in
            guard let self = self else { return }
            self.drinks = drinks
            for i in 0 ..< drinks.count {
                guard let type = self.drinks[i].type else { return }
                guard let capacity = self.drinks[i].capacity else { return }
                guard let pureAlcohol = self.drinks[i].pureAlcohol else { return }
                self.text += "種類\(type)　容量\(capacity)ml　純アルコール量\(pureAlcohol)g\n"
            }
        })
    }
    
    func activityViewControllerPlaceholderItem(_ activityViewController: UIActivityViewController) -> Any {
        return text
    }
    
    func activityViewController(_ activityViewController: UIActivityViewController, itemForActivityType activityType: UIActivity.ActivityType?) -> Any? {
        return text
    }
}
