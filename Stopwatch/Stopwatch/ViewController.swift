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
    let stopButton = UIButton()
    
    var timer: Timer?
    
    var numerofseconds = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addLabel()
        addStartButton()
        addStopButton()
    }

    func addLabel() {
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100.0)
            ])
        label.text = "\(numerofseconds)"
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
        startButton.setTitleColor(.gray, for: .disabled)
        startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
    }
    
    @objc func startButtonTapped() {
        print("start button tapped")
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updatelabel), userInfo: nil, repeats: true)
        startButton.isEnabled = false
        stopButton.setTitle("Stop", for: .normal)
    }
    
    @objc func updatelabel() {
        numerofseconds = 1 + numerofseconds
        label.text = "\(numerofseconds)"
    }
    
    func addStopButton() {
        stopButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stopButton)
        NSLayoutConstraint.activate([
            stopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stopButton.centerYAnchor.constraint(equalTo: label.centerYAnchor,
                                                 constant: 140.0)
            ])
        stopButton.setTitle("Stop", for: .normal)
        stopButton.setTitleColor(.red, for: .normal)
        stopButton.addTarget(self, action: #selector(stopButtonTapped), for: .touchUpInside)
    }
    
    @objc func stopButtonTapped() {
        print("stop button tapped")
        if stopButton.title(for: .normal) == "Stop" {
            self.timer?.invalidate()
            startButton.isEnabled = true
            startButton.setTitle("Continue", for: .normal)
            stopButton.setTitle("Reset", for: .normal)
        }
        
        else if stopButton.title(for: .normal) == "Reset" {
            self.timer?.invalidate()
            numerofseconds = 0
            label.text = "\(numerofseconds)"
            startButton.setTitle("Start", for: .normal)
            stopButton.setTitle("Stop", for: .normal)
             startButton.isEnabled = true
        }
    }
}
