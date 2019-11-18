//
//  ViewController.swift
//  Nabeatsu
//
//  Created by nagata on 2017/06/19.
//  Copyright © 2017年 Life is Tech!. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var number: Int = 0
    
    @IBOutlet var countLabel: UILabel!
    @IBOutlet var faceLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func isAho() -> Bool {
        // 問題1: 3の倍数かどうか調べる
        if number % 3 == 0 {
            return true
        }
//        // 問題2: 1の位が3かどうか調べる
//        if number%10 == 3{
//            return true
//        }
//        // 問題3: 10の位が3かどうか調べる
//        if number/10 % 10 == 3{
//            return true
//        }
        // 問題4: 3がつくかどうか調べる
        // 問題4をやるときは問題3と問題2の答えを消してから書こう
        var Num: Int = number
        
        while Num != 0{
            if Num % 10 == 3{
                return true
            }else {
                Num = Num / 10
            }
        }
        return false
    }
    func isSmart() -> Bool{
        var NUMBER: Int = number
        
        while NUMBER != 0{
            if NUMBER % 5 == 0 || NUMBER%10 == 5{
                return true
            }else{
                NUMBER = NUMBER / 10
            }
        }
        return false
    }
    
    @IBAction func plusButton(){
        number = number + 1
        countLabel.text = String(number)
        
        if isAho() == true {
            faceLabel.text = "ﾍ(ﾟ∀ﾟﾍ)ｱﾋｬ"
        }else if isSmart() == true{
            faceLabel.text = "∠(｀・ω・´)"
        }else {
            faceLabel.text = "(゜o゜)"
        }
    }
    
    @IBAction func clear(){
        number = 0
        countLabel.text = String(number)
    }


}

