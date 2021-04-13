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
}
