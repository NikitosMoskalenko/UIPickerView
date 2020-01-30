//
//  ViewController.swift
//  HWUIPickerView
//
//  Created by Nikita Moskalenko on 1/29/20.
//  Copyright © 2020 Nikita Moskalenko. All rights reserved.


// ДЗ:
// 1) Сделать пикер с выбором года, месяца, дня. Чтобы можно было выбрать дату и вывести её в label.
// 3) В зависимости от выбранного года в пикере - переходим на другой контроллер и выводим там в label название: високосный это год или нет.


import UIKit

final class ViewController: UIViewController {
    
//  MARK: - Private constant
    private let datePicker = UIDatePicker()
    private let dateLabel = UILabel()
    private let nextHWButton = UIButton()
    private let chekingYearButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        addDateLabel()
        addDatePicker()
        addNextHWButton()
        addChekingYearButton()
    }
    
//  MARK: - Private methods
    private func addNextHWButton() {
        nextHWButton.frame = CGRect(x: 250, y: 50, width: 150, height: 40)
        nextHWButton.backgroundColor = .darkGray
        nextHWButton.setTitle("Next Home Work", for: .normal)
        nextHWButton.tintColor = .white
        view.addSubview(nextHWButton)
        nextHWButton.addTarget(self, action: #selector(toSecondVC), for: .touchUpInside)
    }
    
    private func addDatePicker() {
        datePicker.datePickerMode = .date
        datePicker.center = view.center
        datePicker.addTarget(self, action: #selector(dateFormatter), for: .valueChanged)
        view.addSubview(datePicker)
    }
    
    private func addDateLabel() {
        view.addSubview(dateLabel)
        dateLabel.frame = CGRect(x: 90, y: 100, width: 250, height: 50)
        dateLabel.backgroundColor = .magenta
        dateLabel.textAlignment = .center
        dateLabel.textColor = .cyan
    }
    
    @objc private func toSecondVC() {
        let secondVC = SecondHomeWork()
        present(secondVC, animated: true)
    }
    
    @objc private func dateFormatter() {
        if datePicker.isEqual(datePicker) {
            let dateForm = DateFormatter()
            dateForm.dateFormat = "dd/MM/yyyy"
            dateLabel.text = dateForm.string(from: datePicker.date)
        }
    }
    
    private func addChekingYearButton() {
        chekingYearButton.frame = CGRect(x: 20, y: 50, width: 150, height: 40)
        chekingYearButton.backgroundColor = .black
        chekingYearButton.setTitle("Is a leap year?", for: .normal)
        chekingYearButton.tintColor = .darkGray
        view.addSubview(chekingYearButton)
        chekingYearButton.addTarget(self, action: #selector(chekingYear), for: .touchUpInside)
    }
    
    
    @objc private func chekingYear() {
        let newVC = OneMoreHW()
        present(newVC, animated: true)
        
        let date = String(describing: datePicker.date)
        let checkingYear = date.components(separatedBy: "-")[0]
        print(checkingYear)
        
        if let myDateChecking = Int(checkingYear){
            newVC.checkingYear = myDateChecking
        }
        
    }
    
}

