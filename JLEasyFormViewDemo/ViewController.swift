//
//  ViewController.swift
//  JLEasyFormViewDemo
//
//  Created by ChingMi on 2020/3/18.
//  Copyright © 2020 JLOrg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let formView = JLEasyFormView(frame: CGRect(origin: CGPoint(x: 0, y: 60), size: CGSize(width: view.width, height: view.height - 60 ))).setRowHeight(height: 44).setRowHeightList(heightList: [44,45,66,75]).setRowCount(count: 4).setRowTitleList(titleList: ["姓名","昵称","用户ID","积分"]).setLeftTitleMargin(margin: 33).setLeftTitleLabelFont(font: UIFont.systemFont(ofSize: 25)).startBuldRow()
            

        view.addSubview(formView)
            
        //遍历得到每一行的view，可以在此处自定义每一行的控件
        for subView in formView.formRowList{
            
            
            
            
        }
    }


}

