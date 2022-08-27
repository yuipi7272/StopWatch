//
//  ViewController.swift
//  StopWatch
//
//  Created by Yui Ogawa on 2022/08/27.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var label: UILabel!
    
    var count: Float = 0.0
    var timer: Timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @objc func up() {
        // countを0.01足す
        count = count + 0.01
        // ラベルに小数点以下2桁まで表示
        label.text = String(format: "%.2f", count)
    }
    
    @IBAction func start() {
        // タイマーが動作していなかったら、動かす
        if !timer.isValid {
            timer = Timer.scheduledTimer(timeInterval: 0.01,
                                         target: self,
                                         selector: #selector(self.up),
                                         userInfo: nil,
                                         repeats: true)
        }
    }
    
    @IBAction func stop() {
        // タイマー動作していたら、停止する
        if timer.isValid {
            timer.invalidate()
        }
    }
    
    @IBAction func resest(){
        // タイマーが動作していたら、停止する
        if timer.isValid {
            timer.invalidate()
        }
        // countを初期化
        count = 0.0
        // ラベルに表示
        label.text = String(format: "%.2f", count)
    }
}

