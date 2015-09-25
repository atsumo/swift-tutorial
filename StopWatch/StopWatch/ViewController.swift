//
//  ViewController.swift
//  StopWatch
//
//  Created by atsumo on 9/25/15.
//  Copyright © 2015 atsumo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var _count = 0
    var _isRunning = false
    var _timer = NSTimer()

    @IBOutlet weak var label: UILabel!
    
    @IBAction func start(sender: UIButton) {
        if _isRunning == true {
            return
        }
        
        _timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: Selector("update"), userInfo: nil, repeats: true)
        _isRunning = true
    }
    
    @IBAction func stop(sender: UIButton) {
        if _isRunning == false {
            return
        }
        
        _timer.invalidate()
        _isRunning = false
    }
    
    
    @IBAction func reset(sender: UIButton) {
        _count = 0
        label.text = "\(format(0))"
    }
    
    func update() {
        _count++
        label.text = "\(format(_count))"
    }
    
    func format(count:Int) -> String {
        let ms = count % 100
        let s = (count - ms) / 100 % 60
        let m = (count - s - ms) / 6000 % 3600
        return String(format: "%02d:%02d:%02d", m, s, ms)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

