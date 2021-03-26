//
//  MainTabBarController.swift
//  alcon
//
//  Created by 工藤海斗 on 2021/03/26.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTab()
    }
}

private extension MainTabBarController {
    func setupTab() {
        let calendarAndDrinkingRecordViewController = CalendarAndDrinkingRecordViewController()
        calendarAndDrinkingRecordViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .history, tag: 0)
        let settingsViewController = SettingsViewController()
        settingsViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .downloads, tag: 1)
        
        let vcs = [calendarAndDrinkingRecordViewController, settingsViewController]
        let viewControllers = vcs.map{ UINavigationController(rootViewController: $0) }
        setViewControllers(viewControllers , animated: false)
    }
}
