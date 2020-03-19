# JLEasyFormView
Helps you easily create lists view.

#通过简单方便的点语法创建表单页面

```swift
let formView = JLEasyFormView(frame: CGRect(origin: CGPoint(x: 0, y: 60), size: CGSize(width: view.width, height: view.height - 60 )))
.setRowHeight(height: 44) //设置所有行高
.setRowHeightList(heightList: [44,45,66,75]) //单独设置每一行的行高（设置此项则“设置所有行高”不会生效）
.setRowCount(count: 4) //设置行数
.setRowTitleList(titleList: ["姓名","昵称","用户ID","积分"]) //设置每行的标题
.setLeftTitleMargin(margin: 33) //设置标题左侧的间距
.setLeftTitleLabelFont(font: UIFont.systemFont(ofSize: 25)) //设置标题字体Font
.startBuldRow() //结尾处调用，开始搭建
```
            
##添加到父视图
```swift
view.addSubview(formView)
```

##遍历得到每一行的view，可以在此处自定义每一行的控件
```swift
for subView in formView.formRowList{

}
```
