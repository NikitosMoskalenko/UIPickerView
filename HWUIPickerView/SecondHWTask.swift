//
//  NextHomeWorkPage.swift
//  HWUIPickerView
//
//  Created by Nikita Moskalenko on 1/30/20.
//  Copyright © 2020 Nikita Moskalenko. All rights reserved.


//  2) Сделать пикер с выбором часов, минут, секунд. Выводить после выбора времени сообщение в alertview.

import UIKit

final class SecondHomeWork: UIViewController {
    
//  MARK: - Private constant
    
    private let timeDatePicker = UIDatePicker()
    private let doneButton = UIButton()
    private let nextHWButton = UIButton()
    private let backToFirst = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addDatePicker()
        addDoneButton()
        addNextHWButton()
        addBackToFirst()
        view.backgroundColor = .white
    }
    
//  MARK: - Private methods
    
    private func addDatePicker() {
        view.addSubview(timeDatePicker)
        timeDatePicker.datePickerMode = .time
        timeDatePicker.center = view.center
    }
    
    private func addDoneButton() {
        doneButton.frame = CGRect(x: 130, y: 100, width: 150, height: 50)
        doneButton.setTitle("Done", for: .normal)
        doneButton.backgroundColor = .orange
        doneButton.tintColor = .green
        doneButton.addTarget(self, action: #selector(doneAction), for: .touchUpInside)
        view.addSubview(doneButton)
    }
    
    @objc private func doneAction() {
        if timeDatePicker.isEqual(timeDatePicker){
            let format = DateFormatter()
            format.dateFormat = "HH:mm:ss"
            let alert  = UIAlertController(title: format.string(from: timeDatePicker.date), message: nil, preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alert.addAction(alertAction)
            present(alert, animated: true)
        }
    }
    
    private func addNextHWButton() {
        nextHWButton.frame = CGRect(x: 250, y: 50, width: 150, height: 40)
        nextHWButton.backgroundColor = .darkGray
        nextHWButton.setTitle("Next Home Work", for: .normal)
        nextHWButton.tintColor = .white
        view.addSubview(nextHWButton)
        nextHWButton.addTarget(self, action: #selector(toNextHWPage), for: .touchUpInside)
    }
    
    private func addBackToFirst() {
        backToFirst.backgroundColor = .darkGray
        backToFirst.setTitle("Back to the First", for: .normal)
        backToFirst.frame = CGRect(x: 50, y: 50, width: 180, height: 40)
        backToFirst.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        view.addSubview(backToFirst)
    }
    
    @objc private func backAction() {
        let backVC = ViewController()
        present(backVC, animated: true)
    }
    
    @objc private func toNextHWPage() {
        let newHomeWorkVC = OneMoreHW()
        present(newHomeWorkVC, animated: true)
    }
}
