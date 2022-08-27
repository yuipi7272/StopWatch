//
//  ViewController.swift
//  StopWatch
//
//  Created by Yui Ogawa on 2022/08/27.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var label: UILabel!
    // 判定ラベル
    @IBOutlet var hanteiLabel: UILabel!
    
    var count: Float = 0.0
    var timer: Timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    // タイマーのカウントアップ
    @objc func up() {
        // countを0.01足す
        count = count + 0.01
        // ラベルに小数点以下2桁まで表示
        label.text = String(format: "%.2f", count)
    }
    // 「PERFECT!」を表示するかどうか判定
    func hantei(){
        if count > 9.80 && count < 10.20 {
            hanteiLabel.text = "PERFECT!"
        } else if count > 9.70 && count < 10.30 {
            hanteiLabel.text = "GREAT!"
        } else if count > 9.50 && count < 10.50 {
            hanteiLabel.text = "GOOD!"
        } else {
            hanteiLabel.text = "BAD!"
        }
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
        hanteiLabel.text = ""
    }
    
    @IBAction func stop() {
        // タイマー動作していたら、停止する
        if timer.isValid {
            timer.invalidate()
        }
        self.hantei()
    }
    
    @IBAction func resest(){
        // タイマーが動作していたら、停止する
        if timer.isValid {
            timer.invalidate()
        }
        // countを初期化
        count = 0.0
        // ラベルを初期化
        label.text = String(format: "%.2f", count)
        hanteiLabel.text = "Result!"
    }
}

