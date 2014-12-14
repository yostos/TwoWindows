TwoWindows
==========

２つのウィンドウを持つ場合のStoryboardの使い方がわからなかったのでまとめてみました。

## 2つ目のViewControllerを用意する。
メインウィンドウにあるボタンを押すと、２つ目のウィンドウが現れるようなアプリケーションを作ってみます。

StoryBoardを開いて、2つ目のViewControllerを作ります。WindowControllerでないとところが注意店です。

![2014-12-14_13-16-22.png](https://qiita-image-store.s3.amazonaws.com/0/43255/d78df689-8e40-23f7-cbe6-d77d50067d1b.png)

ここでは「Push Me」ボタンのアクションを受けるので、ボタンのactionから２つ目のViewControllerをつなぎ、Modalを選択します。ここでSheetやPopoverを選択すると現れ方が変わります。

２つ目のViewにはラベルと閉じるためのボタンを配置しておきます。

## View間を受け渡すオブジェクトを作る。
View間でデータを受け渡したいのですが、お互いに参照を持っていないので困りました。

「Push Me」ボタンを押して、Modalで２つ目のViewを開く時 prepareForSegue()が動き、ここで参照が渡ってくるのでこの参照を利用します。以下のようにprepareForSegueをオーバーライドし、segueのdestinationControllerをキャストしてSecondViewControllerの参照を取得します。

今回はMessageというクラスを作ったので、このオブジェクトのrepresentaedObjectとしてセットします。

```swift:ViewController.swift
   override func prepareForSegue(segue: NSStoryboardSegue, sender: AnyObject?) {
        let secondViewController = segue.destinationController as SecondViewController
        secondViewController.representedObject = aMessage
    }
```
## ViewControllerクラスを作る。

次に2つ目のViewControllerに対応するNSViewControllerから派生したクラスを作ります。
init()のオーバーライドは必要そうなんで追加しました。StoryBoardのIdentify Inspectorで

まず、２つ目のViewを閉じた時のアクションを追加します。
StoryBoardのCloseボタンから SecondViewControllerのコードエディタにドラッグして@IBAction を作ります。ここではdismiss()としています。

```swift:SecondViewController.swift

    required init?(coder: (NSCoder!)) {
        super.init(coder: coder)
    }
    
    @IBAction func dismiss(sender: AnyObject) {
        self.dismissController(self)
    }
  
}
```

次にラベル用のOutletを作ります。StoryboardからコードエディタにLabelをドラッグします。
そして、representedObjectで渡ってきたMessageオブジェクトからテキストをセットします。セットするのはViewが開かれる際に呼び出されるviewWillAppear()をオーバーライドします。

```swift:SecondViewController.swift
    @IBOutlet weak var aLabel: NSTextField!

    override func viewWillAppear() {
        let aMessage = self.representedObject as Message
        aLabel.stringValue = aMessage.message
    }
```

[GitHub: yostos/TwoWindows](https://github.com/yostos/TwoWindows)
