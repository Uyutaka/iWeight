
##機能
体重、身長をtextFieldに入力することでBMIを判定する。またBMIを元に体型を３種類に判断
Realmを用いて体重を保存

![Output sample](https://github.com/Uyutaka/iWeight/iWeight.gif)


##タスク

### ViewController

- [ ] テキストフィールド（体重）が　数字と.のみで構成されているかを判定
- [ ] deleWeight,deleHeightがnilかどうかをswitchを使って判定ー＞エラーもそれに応じて変化

###SettingViewContoroller
- [ ] テキストフィールド（身長）が数字と．のみで構成されているか判定

###CalcBmiViewController
- [ ] 体重を表示するラベルを作る
- [ ] func pathDBの統一（RecordViewControllerにもある）


###RecordViewController
- [ ] func pathDBの統一（CalcBmiViewControllerにもある）

