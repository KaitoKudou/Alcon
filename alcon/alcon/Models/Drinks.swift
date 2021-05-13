//
//  Drinks.swift
//  alcon
//
//  Created by 工藤海斗 on 2021/04/12.
//

import Foundation

struct Drinks {
    let type: String?
    let capacity: Int?
    let pureAlcohol: Int?
    let date: String?
    
    init(dic: [String: Any]) {
        self.type = dic["type"] as? String ?? ""
        self.capacity = dic["capacity"] as? Int ?? 0
        self.pureAlcohol = dic["pureAlcohol"] as? Int ?? 0
        self.date = dic["date"] as? String ?? ""
    }
}
