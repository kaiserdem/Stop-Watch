//
//  StopWatchViewController.swift
//  Stop Watch
//
//  Created by Kaiserdem on 06.02.2019.
//  Copyright © 2019 Kaiserdem. All rights reserved.
//

import UIKit

class StopWatchViewController: UIViewController {
  
  @IBOutlet weak var resetButton: UIButton!
  @IBOutlet weak var pauseButton: UIButton!
  @IBOutlet weak var startButton: UIButton!
  @IBOutlet weak var timerLable: UILabel!

  var timer = Timer()
  var isTimerRunning = false
  var counter = 0.0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    resetButton.isEnabled = false
    pauseButton.isEnabled = false
    startButton.isEnabled = true
  }
  
  @IBAction func resetDidTap(_ sender: Any) {
    timer.invalidate()
    isTimerRunning = false
    counter = 0.0
    timerLable.text = "00:00:00.0"
    resetButton.isEnabled = false
    pauseButton.isEnabled = false
    startButton.isEnabled = true
  }
  @IBAction func startDidTap(_ sender: Any) {
    if !isTimerRunning {
      timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(rumTimer), userInfo: nil, repeats: true)
      isTimerRunning = true
      
      resetButton.isEnabled = true
      pauseButton.isEnabled = true
      startButton.isEnabled = false
    }
  }
  @IBAction func pauseDidTap(_ sender: Any) {
    resetButton.isEnabled = true
    startButton.isEnabled = true
    resetButton.isEnabled = false
    
    isTimerRunning = false
    timer.invalidate()
    
  }
  // MARK: Helper methods
  @objc func rumTimer() {
      counter += 0.1
    timerLable.text = "\(counter)"
    
    let flooredCounter = Int(floor(counter))
    let hour = flooredCounter / 3600
    
    let minute = (flooredCounter % 3600) / 60
    var minuteString = "\(minute)"
    if minute < 10 {
      minuteString = "0\(minute)"
    }
    let second = (flooredCounter % 3600) % 60
    var secondString = "\(second)"
    if second < 10 {
      secondString = "0\(second)"
    }
    let decusecond = String(format: "%.1f", counter).components(separatedBy: ".").last!
    
    timerLable.text = "\(hour):\(minuteString):\(secondString).\(decusecond)"
  }
}
