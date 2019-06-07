//
//  ViewController.swift
//  Stopwatch
//
//  Created by yohayon on 07.06.19.
//  Copyright © 2019 Yotam Ohayon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let label = UILabel()
    let startButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addLabel()
        addStartButton()
    }

    func addLabel() {
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100.0)
            ])
        label.text = "00:00"
    }
    
    func addStartButton() {
        startButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(startButton)
        NSLayoutConstraint.activate([
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.centerYAnchor.constraint(equalTo: label.centerYAnchor,
                                                 constant: 40.0)
            ])
        startButton.setTitle("Start", for: .normal)
        startButton.setTitleColor(.blue, for: .normal)
        startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
    }
    
    @objc func startButtonTapped() {
        print("start button tapped")
        label.text = "00:01"
    }

}

