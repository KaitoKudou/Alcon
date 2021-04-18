//
//  CalendarView.swift
//  alcon
//
//  Created by 工藤海斗 on 2021/03/26.
//

import Foundation
import FSCalendar

class CalendarView: UIView {
    fileprivate weak var calendar: FSCalendar!
    private let dayOfTheWeeks = ["日":0, "月":1, "火":2, "水":3, "木":4, "金":5, "土":6]
    private let userDefaults = UserDefaults()
    private let dateKey: String = "date"
    private var drinkTableViewModel: DrinkTableViewModel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCalendar()
        drinkTableViewModel = DrinkTableViewModel()
        
        // 今日の日付を取得
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        dateFormatter.locale = Locale(identifier: "ja_JP")
        dateFormatter.dateFormat = "yyyy/M/d"
        let dateString = dateFormatter.string(from: Date())
        userDefaults.set(dateString, forKey: dateKey)
        
//        let current = Calendar.current
//        let year = current.component(.year, from: Date()) //年
//        let month = current.component(.month, from: Date()) //月
//        let day = current.component(.day, from: Date()) //日
//        UserDefaults.standard.register(defaults: ["year" : year, "month": month, "day": day])
//
//        let calendar = Calendar.current
//        let selectDate = calendar.date(from: DateComponents(year: UserDefaults.standard.integer(forKey: "year"), month: UserDefaults.standard.integer(forKey: "month"), day: UserDefaults.standard.integer(forKey: "day")))
//        self.calendar.select(selectDate)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCalendar() {
        let calendar = FSCalendar(frame: CGRect(x: 0, y: 0, width: frame.width, height: 300))
        calendar.appearance.headerDateFormat = "yyyy年MM月"
        calendar.appearance.headerTitleColor = UIColor(hex: "3C58A1")
        calendar.appearance.weekdayTextColor = UIColor(hex: "3C58A1")
        calendar.appearance.selectionColor = UIColor(hex: "73AADD")
        
        for (key, value) in dayOfTheWeeks {
            calendar.calendarWeekdayView.weekdayLabels[value].text = key
        }
        calendar.backgroundColor = UIColor(hex: "C3E2FF")
        addSubview(calendar)
        self.calendar = calendar
        calendar.delegate = self
        calendar.dataSource = self
        
        calendar.anchor(top: topAnchor, bottom: bottomAnchor, left: leftAnchor, right: rightAnchor)
    }
}

extension CalendarView: FSCalendarDelegate, FSCalendarDataSource {
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let tmpDate = Calendar(identifier: .gregorian)
        let year = tmpDate.component(.year, from: date)
        let month = tmpDate.component(.month, from: date)
        let day = tmpDate.component(.day, from: date)

        userDefaults.set("\(year)/\(month)/\(day)", forKey: dateKey)
//        UserDefaults.standard.set(year, forKey: "year")
//        UserDefaults.standard.set(month, forKey: "month")
//        UserDefaults.standard.set(day, forKey: "day")
        drinkTableViewModel.fetchDailyDrinkList(date: "\(year)/\(month)/\(day)", completion: { [weak self] drinks in
            guard self != nil else { return }
            NotificationCenter.default.post(name: .applyDrink, object: nil, userInfo: ["drinks": drinks])
        })
    }
}
