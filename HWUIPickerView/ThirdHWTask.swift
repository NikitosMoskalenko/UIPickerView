//
//  OneMoreHW.swift
//  HWUIPickerView
//
//  Created by Nikita Moskalenko on 1/30/20.
//  Copyright © 2020 Nikita Moskalenko. All rights reserved.


//3) В зависимости от выбранного года в пикере - переходим на другой контроллер и выводим там в label название: високосный это год или нет.

import UIKit

final class OneMoreHW: UIViewController {

// MARK: - Private constant
    private let checkingLabel = UILabel()
    private let nextHWButton = UIButton()
    private let backToFirst = UIButton()
    var checkingYear = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        addCheckingLabel()
//        checkingDate()
        addNextHWButton()
        addBackToFirst()
    }

//  MARK: - Private methods
    private func addCheckingLabel() {
        checkingLabel.textAlignment = .center
        checkingLabel.textColor = .blue
        checkingLabel.frame = CGRect(x: 120, y: 200, width: 150, height: 50)
        checkingLabel.backgroundColor = .white
        checkingLabel.text = checkingDate(year: checkingYear) ? "It is a leap year" : "It is not a leap year"
        view.addSubview(checkingLabel)
    }
    
    private func addNextHWButton() {
        nextHWButton.frame = CGRect(x: 250, y: 50, width: 150, height: 40)
        nextHWButton.backgroundColor = .darkGray
        nextHWButton.setTitle("Next Home Work", for: .normal)
        nextHWButton.tintColor = .white
        view.addSubview(nextHWButton)
        nextHWButton.addTarget(self, action: #selector(toSecondVC), for: .touchUpInside)
    }
    
    private func checkingDate(year: Int) -> Bool {
//        if checkingYear % 4 == 0 {
//            checkingLabel.text = "It is a leap year"
//        } else if checkingYear % 4 != 0 {
//            checkingLabel.text = "It is not a leap year"
//        }
        return year % 4 == 0
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
    
    @objc private func toSecondVC() {
        let secondVC = SecondHomeWork()
        present(secondVC, animated: true)
    }
    
}
