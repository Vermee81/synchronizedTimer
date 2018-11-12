//
//  ViewController.swift
//  syncronizedTimer
//
//  Created by Hiroo Kusaba on 2018/10/20.
//  Copyright © 2018年 Hiroo Kusaba. All rights reserved.
//

import UIKit

class StopWatchViewController: UIViewController {
    
    @IBOutlet weak var timerMinute: UILabel!
    @IBOutlet weak var timerSecond: UILabel!
    @IBOutlet weak var timerMilliSecond: UILabel!
    
    weak var timer: Timer!
    var startTime = Date()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func startTimer(_ sender: Any) {
        if timer != nil {
            timer.invalidate()
        }
        
        timer = Timer.scheduledTimer(
            timeInterval: 0.01,
            target: self,
            selector: #selector(self.timerCounter),
            userInfo: nil,
            repeats: true)
        
        startTime = Date()
        
    }
    
    @objc func timerCounter() {
        // タイマー開始からのインターバル時間
        let currentTime = Date().timeIntervalSince(startTime)
        
        let minute = (Int)(fmod((currentTime / 60), 60))
        let second = (Int)(fmod(currentTime, 60))
        let milliSecond = (Int)((currentTime - floor(currentTime)) * 100)
        
        let strMinute = String(format: "%02d", minute)
        let strSecond = String(format: "%02d", second)
        let strMsec = String(format: "%02d", milliSecond)
        
        timerMinute.text = strMinute
        timerSecond.text = strSecond
        timerMilliSecond.text = strMsec
        
    }
    
    @IBAction func stopTimer(_ sender: Any) {
        if timer != nil {
            timer.invalidate()
        }
    }
    
    @IBAction func resetTimer(_ sender: Any) {
        timerMinute.text = "00"
        timerSecond.text = "00"
        timerMilliSecond.text = "00"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        timer.invalidate()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
