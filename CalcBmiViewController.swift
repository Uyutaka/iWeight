//
//  CalcBmiViewController.swift
//  i体重
//
//  Created by Yutaka on 2015/03/05.
//  Copyright (c) 2015年 urayuta.com. All rights reserved.
//

import UIKit
import Realm

class CalcBmiViewController: UIViewController {

    @IBOutlet weak var bmiLabel: UILabel!
    
    @IBOutlet weak var stateLabel: UILabel!
    
    @IBAction func goBackHome(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
      
        
        
        // app delegateを使ってデータをget　http://qiita.com/xa_un/items/814a5cd4472674640f58
        var appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate //AppDelegateのインスタンスを取得
        var deleWeight = appDelegate.deleWeight!
        var deleHeight = appDelegate.deleHeight!
        println("DELE")
        println(deleWeight)
        
        let bmi:Double = calcBmi(deleHeight, weight: deleWeight)
        
        let state:String = checkState(bmi)
        

        self.bmiLabel.text = NSString(format: "%.2f", bmi)

        
        self.stateLabel.text = state

        
    
        // DB処理
            // pathを確認
            println(RLMRealm.defaultRealmPath())
            println("_____")
            
            
            // defaultのパスを設定（モデルを変更した時Db名を変えた必要あり）
            let path:String = pathDb("weight.realm")
            RLMRealm.setDefaultRealmPath(path)
//            println(RLMRealm.defaultRealmPath())
        
            let realm = RLMRealm.defaultRealm()
            
            
            // INSERTするweightインスタンスを作成
            let weight = Weight()
            weight.weight = deleWeight
            weight.date = getLocalTime()
            
            
            // weightオブジェクトをINSERT
            realm.beginWriteTransaction()
            realm.addObject(weight)
            realm.commitWriteTransaction()
            
            // 検索
            for realmWeight in Weight.allObjects(){
                println("+++++++++++++++")
                println((realmWeight as Weight).weight)
                println((realmWeight as Weight).date)
            }

      
        
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
    
    
    
    func getLocalTime() -> String{
        
        // localTime表示   http://www.davidbreyer.com/programming/2014/06/10/getting-local-date-and-time-with-swift/
        
        let date = NSDate();
        let dateFormatter = NSDateFormatter()
        //To prevent displaying either date or time, set the desired style to NoStyle.
        dateFormatter.timeStyle = NSDateFormatterStyle.MediumStyle //Set time style
        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle //Set date style
        dateFormatter.timeZone = NSTimeZone()
        let localDate = dateFormatter.stringFromDate(date)
        
        //println(date)       ->  UTC Time   :: 2015-03-06 06:45:46 +0000
        //println(localDate)  ->  Local Time :: Mar 6, 2015, 3:42:48 PM
        
        
        return localDate
        
    }
    
    //DBのpathを生成 http://qiita.com/f_clover/items/1ba0785e3257cc075907
    func pathDb(dbName:String) -> String{
        var path:String = NSHomeDirectory() + "/Documents/" + dbName
        return path
    }

}
