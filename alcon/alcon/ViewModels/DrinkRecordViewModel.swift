//
//  DrinkRecordViewModel.swift
//  alcon
//
//  Created by 工藤海斗 on 2021/04/12.
//

import FirebaseFirestore
import Foundation

class DrinkRecordViewModel {
    
    func fetchDrinkLists(completion: @escaping ([Drinks]) -> Void) {
        let firestore = Firestore.firestore()
        firestore.collection("drinkLists").getDocuments { [weak self] (querySnapshots, err) in
            guard self != nil else { return }
            
            if let err = err {
                print("お酒一覧情報読み込みエラー: \(err)")
                return
            }
            
            let drinks = querySnapshots?.documents.map({ (snapshot) -> Drinks in
                let dic = snapshot.data()
                let drink: Drinks = Drinks(dic: dic)
                return drink
            })
            completion(drinks ?? [Drinks]())
        }
    }
    
    func createDoucumentsID() -> String {
        let randomString = "abcdefghijklmnopqrstuvwsyzABCDEFGHIJKLMNOPQRSTUVWSYZ0123456789-"
        var id = ""
        for _ in 0 ..< 31 {
            let stringElement = randomString.randomElement()
            id.append(stringElement!)
        }
        return id
    }
    
    func registerDailyDrink(date: String, drinkName: String, capacity: Int, pureAlcohol: Int) {
        let firestore = Firestore.firestore()
        let drinkDoc: [String: Any] = ["date": date, "drinkName": drinkName, "capacity": capacity, "pureAlcohol": pureAlcohol]
        firestore.collection("users").document(UIDevice.current.identifierForVendor!.uuidString).collection("drink").document(createDoucumentsID.self()).setData(drinkDoc) { (err) in
            if let err = err {
                print("飲酒記録書き込み失敗: \(err)")
            } else {
                print("飲酒記録書き込み成功")
            }
        }
        
    }
}
