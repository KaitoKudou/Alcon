//
//  ViewController.swift
//  alcon
//
//  Created by 工藤海斗 on 2021/03/25.
//

import UIKit

class ViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "HOME"
        view.backgroundColor = .white
        self.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 0)
        viewControllers?.append(self)
        
        let view1 = UIView()
        view1.backgroundColor = .yellow
        
        let view2 = UIView()
        view2.backgroundColor = .blue
        
        let view3 = UIView()
        view3.backgroundColor = .green
        
        let view4 = UIView()
        view4.backgroundColor = .red
        
        let stackView = UIStackView(arrangedSubviews: [view1, view2, view3, view4])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        
//        self.view.addSubview(stackView)
//
//        [
//            view1.heightAnchor.constraint(equalToConstant: 100),
//            view2.heightAnchor.constraint(equalToConstant: 200),
//            view3.heightAnchor.constraint(equalToConstant: 50),
//
//            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
//            stackView.leftAnchor.constraint(equalTo: view.leftAnchor),
//            stackView.rightAnchor.constraint(equalTo: view.rightAnchor)].forEach({
//                $0.isActive = true
//            })
    }


}

