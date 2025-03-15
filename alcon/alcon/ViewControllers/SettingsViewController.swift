//
//  SettingsViewController.swift
//  alcon
//
//  Created by 工藤海斗 on 2021/03/26.
//

import SafariServices
import UIKit

class SettingsViewController: UIViewController {
    
    var settingTableView: UITableView = UITableView(frame: .zero, style: .grouped)
    let sectionTitle: [String] = ["目標変更", "バージョン", "その他"] // Sectionのタイトル
    // section毎のラベル
    let sectionLabel1: NSArray = ["節酒目標"]
    let sectionLabel3: NSArray = ["お問い合わせ", "利用規約", "プライバシーポリシー"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "設定"
        settingTableView.delegate = self
        settingTableView.dataSource = self
        settingTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        settingTableView.backgroundColor = UIColor(light: .white, dark: .black)
        view.addSubview(settingTableView)
        settingTableView.anchor(top: view.topAnchor, bottom: view.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor)
    }
    
    func toSafariView(index: Int) {
        switch index {
        case 0: // お問い合わせ
            let url = "https://docs.google.com/forms/d/e/1FAIpQLScLInUYwPb8NH59JYO3Mi6-6cRLhtF9IyJVaPUUBxkLMkv3bg/viewform"
            let safariVC = SFSafariViewController(url: NSURL(string: url)! as URL)
            safariVC.modalPresentationStyle = .fullScreen
            present(safariVC, animated: true, completion: nil)
        case 1: // 利用規約
            let url = "https://sites.google.com/view/alcon-app/terms-of-use?authuser=0"
            let safariVC = SFSafariViewController(url: NSURL(string: url)! as URL)
            safariVC.modalPresentationStyle = .fullScreen
            present(safariVC, animated: true, completion: nil)
        case 2: // プライバシーポリシー
            let url = "https://sites.google.com/view/alcon-app/privacy-policy?authuser=0"
            let safariVC = SFSafariViewController(url: NSURL(string: url)! as URL)
            safariVC.modalPresentationStyle = .fullScreen
            present(safariVC, animated: true, completion: nil)
        default:
            return
        }
    }
}

extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    // Section数
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitle.count
    }
    
    // Sectioのタイトル
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitle[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return sectionLabel1.count
        } else if section == 1 {
            return 1
        } else if section == 2 {
            return sectionLabel3.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.backgroundColor = UIColor(light: .white, dark: UIColor(hex: "262626"))
        if indexPath.section == 0 {
            cell.accessoryType = .disclosureIndicator
            cell.textLabel?.text = sectionLabel1[indexPath.row] as? String
        } else if indexPath.section == 1 {
            cell.textLabel?.text = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
        } else if indexPath.section == 2 {
            cell.textLabel?.text = sectionLabel3[indexPath.row] as? String
        }
        return cell
    }
    
    // セルタップ時に呼ばれるメソッド
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            let goalChangeViewController = GoalChangeViewController()
            navigationController?.pushViewController(goalChangeViewController, animated: true)
        } else if indexPath.section == 1 {
        } else if indexPath.section == 2 {
            toSafariView(index: indexPath.row)
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
