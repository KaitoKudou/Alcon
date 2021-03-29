//
//  CalendarView.swift
//  alcon
//
//  Created by 工藤海斗 on 2021/03/26.
//

import Foundation
import FSCalendar

class CalendarView: UIView, FSCalendarDataSource, FSCalendarDelegate {
    fileprivate weak var calendar: FSCalendar!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCalendar()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCalendar() {
        let calendar = FSCalendar(frame: CGRect(x: 0, y: 0, width: frame.width, height: 300))
        calendar.dataSource = self
        calendar.delegate = self
        calendar.backgroundColor = UIColor(hex: "C3E2FF")
        addSubview(calendar)
        self.calendar = calendar
        
        calendar.translatesAutoresizingMaskIntoConstraints = false
        calendar.topAnchor.constraint(equalTo: topAnchor).isActive = true
        calendar.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        calendar.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        calendar.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
}
