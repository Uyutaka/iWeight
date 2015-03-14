//
//  RecordViewController.swift
//  i体重
//
//  Created by Yutaka on 2015/03/09.
//  Copyright (c) 2015年 urayuta.com. All rights reserved.
//

import UIKit
import Realm

class RecordViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBAction func goBackHome(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        // DBの検索に必要
        let path:String = pathDb("weight.realm")
        RLMRealm.setDefaultRealmPath(path)
        
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
    
    /* UITableViewDataSourceプロトコル */
    
    // セクションごとの行数を返す
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
   
        // DBの検索に必要
        let path:String = pathDb("weight.realm")
        RLMRealm.setDefaultRealmPath(path)
        
        var count = 0
        for realmWeight in Weight.allObjects(){
            count += 1
        }
        
        return count //rowの数
    }
    
    // 各行に表示するセルを返す
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // セル番号でセルを取り出す
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        
        
        let path:String = pathDb("weight.realm")
        RLMRealm.setDefaultRealmPath(path)
        let weight = Weight.allObjects()
        
        // セル詳細を表示
        cell.textLabel?.text = weight[UInt(indexPath.row)].date
        
        // セルタイトルを表示
        cell.detailTextLabel?.text = weight[UInt(indexPath.row)].weight.description + "kg"
        
        return cell
    }
    
    // セクション数
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    // セクションタイトル
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        // セクション番号をタイトルにする
        return "体重(section)" + section.description
    }
    
    /* UITableViewDelegateデリゲートメソッド */
    // 行が選択された
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("セクション\(indexPath.section)のセル\(indexPath.row)が選択された")
    }
    
    //DBのpathを生成 http://qiita.com/f_clover/items/1ba0785e3257cc075907
    func pathDb(dbName:String) -> String{
        var path:String = NSHomeDirectory() + "/Documents/" + dbName
        return path
    }
}