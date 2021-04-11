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
        let calendarSelectedImage = UIImage(named: "calendar_selected")?.resize(size: .init(width: 30, height: 30))
        let calendarUnselectedImage = UIImage(named: "calendar_unselected")?.resize(size: .init(width: 30, height: 30))
        calendarAndDrinkingRecordViewController.tabBarItem = UITabBarItem(title: "calender", image: calendarUnselectedImage?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal), selectedImage: calendarSelectedImage?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal))
        
        let settingsViewController = SettingsViewController()
        let settingsSelectedImage = UIImage(named: "settings_selected")?.resize(size: .init(width: 30, height: 30))
        let settingsUnselectedImage = UIImage(named: "settings_unselected")?.resize(size: .init(width: 30, height: 30))
        settingsViewController.tabBarItem = UITabBarItem(title: "settings", image: settingsUnselectedImage?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal), selectedImage: settingsSelectedImage?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal))
        
        let vcs = [calendarAndDrinkingRecordViewController, settingsViewController]
        let viewControllers = vcs.map{ UINavigationController(rootViewController: $0) }
        setViewControllers(viewControllers , animated: false)
    }
}
