//
//  DrinkTableViewModel.swift
//  alcon
//
//  Created by 工藤海斗 on 2021/04/18.
//

import FirebaseFirestore
import Foundation

class DrinkTableViewModel {
    
    func fetchDailyDrinkList(date: String, completion: @escaping ([Drinks]) -> Void) {
        let firestore = Firestore.firestore()
        firestore.collection("users").document(UIDevice.current.identifierForVendor!.uuidString).collection("drink").whereField("date", isEqualTo: date).getDocuments { [weak self] (querySnapshots, err) in
            guard self != nil else { return }
            
            if let err = err {
                print("日付別飲酒記録読み込み失敗: \(err)")
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
}
