//
//  GoalChangeViewModel.swift
//  alcon
//
//  Created by 工藤海斗 on 2021/04/14.
//

import FirebaseFirestore
import Foundation

class GoalChangeViewModel {
    
    func changeGoal(goaltext: String?) {
        let firestore = Firestore.firestore()
        guard let goal = goaltext else { return }
        let goalDoc: [String: String] = ["goal": goal]
        
        firestore.collection("users").document(UIDevice.current.identifierForVendor!.uuidString).setData(goalDoc) { (err) in
            if let err = err {
                print("節酒目標変更失敗: \(err)")
            } else {
                print("節酒目標変更成功")
            }
        }
        print(UIDevice.current.identifierForVendor!.uuidString)
    }
}
