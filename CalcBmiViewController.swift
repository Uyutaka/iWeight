//
//  CalcBmiViewController.swift
//  i体重
//
//  Created by Yutaka on 2015/03/05.
//  Copyright (c) 2015年 urayuta.com. All rights reserved.
//

import UIKit

class CalcBmiViewController: UIViewController {

    @IBOutlet weak var bmiLabel: UILabel!
    
    @IBOutlet weak var stateLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        println(height)
        
        let bmi:Double = calcBmi(1.78, weight: 68)
        let state:String = checkState(bmi)
        
        self.bmiLabel.text = bmi.description
        self.stateLabel.text = state
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    func calcBmi(height:Double, weight:Double) -> Double{
        let bmi:Double = weight / (height * height)
        return bmi
    }
    
    func checkState(bmi:Double) -> String{
        if bmi <= 18.0{
            return "痩せすぎ"
        }else if bmi <= 25{
            return "正常"
        }else{
            return "デブ"
        }
    }

}
