# JLEasyFormView
Helps you easily create lists view.

//通过简单方便的点语法创建表单页面

let formView = JLEasyFormView(frame: view.bounds).setRowHeight(height: Double(pixwn(58))).setRowCount(count: 3).setRowTitleList(titleList: ["基础使用介绍","运动功能介绍","手表日常维护"]).setRowWidth(width: Double(pixwn(351))).setRowLineColor(color: UIColor.hex("#EFF0F5")) .startBuldRow()
//添加到父视图

view.addSubview(formView)
