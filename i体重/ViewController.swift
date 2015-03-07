//
//  ViewController.swift
//  i体重
//
//  Created by Yutaka on 2015/03/05.
//  Copyright (c) 2015年 urayuta.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var weightField: UITextField!
    
    @IBAction func resultButton() {
        
        var appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate //AppDelegateのインスタンスを取得
        let deleWeight = appDelegate.deleWeight
        let deleHeight = appDelegate.deleHeight
        
        //TODO deleHeight, deleWeightをswitch文で分岐
        
        if(deleHeight == nil){
            println("身長：未入力")
        
            
            let alert:UIAlertController = UIAlertController(title:"エラー",
                message: "先に身長を入力してください",
                preferredStyle: UIAlertControllerStyle.Alert)
            
            //Cancel 一つだけしか指定できない
            let cancelAction:UIAlertAction = UIAlertAction(title: "戻る",
                style: UIAlertActionStyle.Cancel,
                handler:{
                    (action:UIAlertAction!) -> Void in
                    println("Cancel")
            })

            alert.addAction(cancelAction)
            
            //表示。UIAlertControllerはUIViewControllerを継承している。
            presentViewController(alert, animated: true, completion: nil)
            
        }else if(deleWeight == nil){
            println("体重：未入力")
            
            
            let alert:UIAlertController = UIAlertController(title:"エラー",
                message: "先に体重を入力してください",
                preferredStyle: UIAlertControllerStyle.Alert)
            
            //Cancel 一つだけしか指定できない
            let cancelAction:UIAlertAction = UIAlertAction(title: "戻る",
                style: UIAlertActionStyle.Cancel,
                handler:{
                    (action:UIAlertAction!) -> Void in
                    println("Cancel")
            })
            
            alert.addAction(cancelAction)
            
            //表示。UIAlertControllerはUIViewControllerを継承している。
            presentViewController(alert, animated: true, completion: nil)
            
        }
        
        else {
            println("押された ")
            
            // 次のViewへ移る　http://ja.stackoverflow.com/questions/4371/xcodeswift%E3%81%A7%E3%81%AE%E3%82%BB%E3%82%B0%E3%82%A8%E3%82%92%E4%BD%BF%E3%82%8F%E3%81%AA%E3%81%84%E7%94%BB%E9%9D%A2%E9%81%B7%E7%A7%BB%E3%81%AB%E3%81%A4%E3%81%84%E3%81%A6
            var nex : AnyObject! = self.storyboard?.instantiateViewControllerWithIdentifier("next")
            self.presentViewController(nex as UIViewController, animated: true, completion: nil)
            

        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        
        // textFieldにデリゲートを設定する
        self.weightField.delegate = self


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool // return NO to not change text
    {
    
        // textFieldの値をtmpStrに代入
        var tmpStr = textField.text as NSString
        tmpStr = tmpStr.stringByReplacingCharactersInRange(range, withString: string)
        
        
        if tmpStr == "" {
            println("空です")
        }else{
            println(tmpStr)
            
            var test:Double = NSString(string: tmpStr).doubleValue
            println(test)
            // appdelegateを使ってデータをset　http://qiita.com/xa_un/items/814a5cd4472674640f58
            var appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate //AppDelegateのインスタンスを取得
            
            appDelegate.deleWeight = NSString(string: tmpStr).doubleValue // NSString->Double　に変換後delegateに代入 http://qiita.com/MashMorgan/items/771f8143470b80bd9996

        }
        return true
    }
    
    func textFieldShouldClear(textField: UITextField) -> Bool // called when clear button pressed. return NO to ignore (no notifications)
    {
        println("クリアボタン押されたよ")
        return true
    }
    
    // returnキーでキーボードを隠す http://gupuru.hatenablog.jp/entry/2014/06/18/195335
    func textFieldShouldReturn(textField: UITextField!) -> Bool{
        textField.resignFirstResponder()
        return true
    }

}

