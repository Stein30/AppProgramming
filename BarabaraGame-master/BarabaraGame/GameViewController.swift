//
//  GameViewController.swift
//  BarabaraGame
//
//  Created by Mio on 2018/04/14.
//  Copyright © 2018年 Mio. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet var imgView1: UIImageView! //top
    @IBOutlet var imgView2: UIImageView! //middle
    @IBOutlet var imgView3: UIImageView! //bottom
    
    @IBOutlet var resultLabel: UILabel!
    
    var timer: Timer!
    var score: Int = 1000
    let defaults: UserDefaults = UserDefaults.standard
    
    let width: CGFloat = UIScreen.main.bounds.size.width
    
    var positionX: [CGFloat] = [0.0,0.0,0.0]
    var dx: [CGFloat] = [1.0, 0.5,-1.0] //画像の動かす幅
    
    
    func start(){
        resultLabel.isHidden = true
        timer = Timer.scheduledTimer(timeInterval: 0.005, target: self, selector: #selector(self.up), userInfo: nil, repeats: true)
        timer.fire()
    }
    @objc 
    func up(){
        for i in 0..<3{
            if positionX[i] > width || positionX[i] < 0 {
                dx[i] = dx[i] * (-1)
            }
            positionX[i] += dx[i]
        }
        imgView1.center.x = positionX[0]
        imgView2.center.x = positionX[1]
        imgView3.center.x = positionX[2]
    }
    
    @IBAction func stop(){
        if timer.isValid == true {
            timer.invalidate()
            for i in 0..<3 {
                score = score - abs(Int(width/2 - positionX[i]))*2
            }
            resultLabel.text = "Score:" + String(score)
            resultLabel.isHidden = false
            
        }
        
        let highScore1: Int = defaults.integer(forKey: "score1")
        let highScore2: Int = defaults.integer(forKey: "score2")
        let highScore3: Int = defaults.integer(forKey: "score3")
        
        if score > highScore1 {
            defaults.set(score, forKey:"score1")
            defaults.set(highScore1, forKey:"score2")
            defaults.set(highScore2, forKey:"score3")
        }else if score > highScore2 {
            defaults.set(score, forKey:"score2")
            defaults.set(highScore2, forKey:"score3")
        }else if score > highScore3{
            defaults.set(score,forKey:"score3")
        }
        defaults.synchronize()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        positionX = [width/2, width/2, width/2]
        self.start()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func retry(){
        score = 1000
        positionX = [width/2, width/2, width/2]
        if timer.isValid == false{
            self.start()
        }
    }
    @IBAction func toTop(){
        self.dismiss(animated: true, completion: nil)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
