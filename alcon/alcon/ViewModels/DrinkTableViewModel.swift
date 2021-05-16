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
    
    func fetchOverallDrinkList(completion: @escaping ([Drinks]) -> Void) {
        let firestore = Firestore.firestore()
        firestore.collection("users").document(UIDevice.current.identifierForVendor!.uuidString).collection("drink").getDocuments { [weak self] (querySnapshots, err) in
            guard self != nil else { return }
            
            if let err = err {
                print("全体飲酒記録読み込み失敗: \(err)")
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
    
    func deleteDailyDrinkList(date: String, drinks: Drinks, completion: @escaping ([Drinks]) -> Void) {
        let firestore = Firestore.firestore()
        firestore.collection("users").document(UIDevice.current.identifierForVendor!.uuidString).collection("drink").whereField("date", isEqualTo: date).whereField("type", isEqualTo: drinks.type ?? "").whereField("capacity", isEqualTo: drinks.capacity ?? 0).whereField("pureAlcohol", isEqualTo: drinks.pureAlcohol ?? 0).getDocuments { [weak self] (querySnapshots, err) in
            
            guard self != nil else { return }
            
            if let err = err {
                print("日付別飲酒記録読み込み失敗: \(err)")
                return
            }
            
            let document = querySnapshots?.documents
            firestore.collection("users").document(UIDevice.current.identifierForVendor!.uuidString).collection("drink").document(document?[0].documentID ?? "").delete()
            
            firestore.collection("users").document(UIDevice.current.identifierForVendor!.uuidString).collection("drink").getDocuments { [weak self] (querySnapshots, err) in
                guard self != nil else { return }
                
                if let err = err {
                    print("全体飲酒記録読み込み失敗: \(err)")
                    return
                }
                
                let deletedDrinksResult = querySnapshots?.documents.map({ (snapshot) -> Drinks in
                    let dic = snapshot.data()
                    let drink: Drinks = Drinks(dic: dic)
                    return drink
                })
                completion(deletedDrinksResult ?? [Drinks]())
            }
        }
    }
}
