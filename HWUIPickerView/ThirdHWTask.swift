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
//    private let checkingLabel = UILabel()
    private let nextHWButton = UIButton()
    private let backToFirst = UIButton()
    private let leapLabel = UILabel()
    private let notLeapLabel = UILabel()
    var checkingYear = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
//        addCheckingLabel()
        addNextHWButton()
        addBackToFirst()
        checkingDate()
    }

//  MARK: - Private methods
    private func addLeapLabel() {
        leapLabel.textAlignment = .center
        leapLabel.textColor = .blue
        leapLabel.frame = CGRect(x: 120, y: 200, width: 150, height: 50)
        leapLabel.text = "It is a leap year"
        view.addSubview(leapLabel)
    }
    
    private func addNotLeapLabel() {
        notLeapLabel.textAlignment = .center
        notLeapLabel.textColor = .blue
        notLeapLabel.frame = CGRect(x: 120, y: 200, width: 150, height: 50)
        notLeapLabel.text = "Ït is not a leap year"
        view.addSubview(notLeapLabel)

    }
    
//    private func addCheckingLabel() {
//        checkingLabel.textAlignment = .center
//        checkingLabel.textColor = .blue
//        checkingLabel.frame = CGRect(x: 120, y: 200, width: 150, height: 50)
//        checkingLabel.backgroundColor = .white
//        view.addSubview(checkingLabel)
//    }
    
    private func addNextHWButton() {
        nextHWButton.frame = CGRect(x: 250, y: 50, width: 150, height: 40)
        nextHWButton.backgroundColor = .darkGray
        nextHWButton.setTitle("Next Home Work", for: .normal)
        nextHWButton.tintColor = .white
        view.addSubview(nextHWButton)
        nextHWButton.addTarget(self, action: #selector(toSecondVC), for: .touchUpInside)
    }
    
    private func checkingDate(){
        if checkingYear % 4 == 0, checkingYear % 100 != 0 {
           addLeapLabel()
        } else {
           addNotLeapLabel()
        }
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
