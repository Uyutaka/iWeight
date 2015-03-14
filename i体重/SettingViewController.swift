//
//  SettingViewController.swift
//  i体重
//
//  Created by Yutaka on 2015/03/05.
//  Copyright (c) 2015年 urayuta.com. All rights reserved.
//

import UIKit

//var height:Double = 0

class SettingViewController: UIViewController, UITextFieldDelegate {
    var height:Double = 0
    @IBOutlet weak var heightField: UITextField!

    
    
    @IBAction func goBackHome(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // textFieldにデリゲートを設定する
        self.heightField.delegate = self
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
    
    
    // TextField関連
    func textFieldShouldClear(textField: UITextField) -> Bool // called when clear button pressed. return NO to ignore (no notifications)
    {
        println("クリアボタン押されたよ")
        return true
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
            

        
            // appdelegateを使ってデータをset　http://qiita.com/xa_un/items/814a5cd4472674640f58
            var appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate //AppDelegateのインスタンスを取得
        
            
        
            //TODO textFieldが数字のみで構成されているか　の　チェック　http://d.akiroom.com/2013-12/nsstring-character-validator/
            appDelegate.deleHeight = NSString(string: tmpStr).doubleValue / 100 // NSString->Double　に変換後 100で割って（mに変換）delegateに代入 http://qiita.com/MashMorgan/items/771f8143470b80bd9996
            
        }
        return true
    }
    
    // returnキーでキーボードを隠す http://gupuru.hatenablog.jp/entry/2014/06/18/195335
    func textFieldShouldReturn(textField: UITextField!) -> Bool{
        textField.resignFirstResponder()
        return true
    }

}
