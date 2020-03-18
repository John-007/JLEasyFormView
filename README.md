# JLEasyFormView
Helps you easily create lists view.

//通过简单方便的点语法创建表单页面

 let formView = JLEasyFormView(frame: CGRect(origin: CGPoint(x: 0, y: 60), size: CGSize(width: view.width, height: view.height - 60 ))).setRowHeight(height: 44).setRowHeightList(heightList: [44,45,66,75]).setRowCount(count: 4).setRowTitleList(titleList: ["姓名","昵称","用户ID","积分"]).startBuldRow()
            
//添加到父视图

view.addSubview(formView)
