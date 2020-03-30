//
//  JLEasyFormView.swift
//
//  Created by ChingMi on 2020/3/18.
//  Copyright © 2020  John. All rights reserved.
//

import UIKit

public typealias SelectBlock = (Int, Int, Int) -> ()

class JLEasyFormView: UIView {
    
    /// 选中的回调
    public var selectBlock: SelectBlock?
    
    var rowHeight = 44.0
    var rowWidth = 0.0
    //给出所有行的数组
    var rowHeightList:Array<Double> = Array()
    //给出特殊行的[key(行号):value(行高)]
    var specialLineHeightDict:Dictionary<Int,Double> = [:]
    //左侧label内容数组
    var rowTitleList:Array<String> = Array()
    
    var rowBGColor = UIColor.white
    var rowLineColor = UIColor.black
    var rowLineWidth = 0.0
    var rowCount = 0
    
    var leftTitleMargin = 20.0
    var leftTitleLabelFont = UIFont.systemFont(ofSize: 14)
    var leftTitleLabelColor = UIColor.black
    var formRowList:Array<UIView> = Array()
    
    
    @discardableResult func setRowCount(count: Int) -> Self {
        self.rowCount = count
        return self
    }
    
    ///行高
    @discardableResult func setRowHeightList(heightList:Array<Double>) -> Self {
        self.rowHeightList = heightList
        return self
    }
    @discardableResult func setSpecialLineHeightDict(dict:Dictionary<Int,Double>) -> Self {
        self.specialLineHeightDict = dict
        return self
    }
    @discardableResult func setRowHeight(height: Double) -> Self {
        self.rowHeight = Double(height)
        return self
    }
    ///行宽
    @discardableResult func setRowWidth(width: Double) -> Self {
        self.rowWidth = Double(width)
        return self
    }
    ///行列背景色
    @discardableResult func setRowBGColor(color: UIColor) -> Self {
        self.rowBGColor = color
        return self
    }
    ///分割线背景色
    @discardableResult func setRowLineColor(color: UIColor) -> Self {
        self.rowLineColor = color
        return self
    }
    ///分割线背景色
    @discardableResult func setRowLineWidth(lineWidth: Double) -> Self {
        self.rowLineWidth = lineWidth
        return self
    }
    ///标题左侧边距
    @discardableResult func setLeftTitleMargin(margin: Double) -> Self {
        self.leftTitleMargin = Double(margin)
        return self
    }
    ///标题文字Font
    @discardableResult func setLeftTitleLabelFont(font: UIFont) -> Self {
        self.leftTitleLabelFont = font
        return self
    }
    ///标题文字颜色
    @discardableResult func setLeftTitleLabelColor(color: UIColor) -> Self {
        self.leftTitleLabelColor = color
        return self
    }
    ///标题数组
    @discardableResult func setRowTitleList(titleList: Array<String>) -> Self {
        self.rowTitleList = titleList
        return self
    }
    
    @discardableResult func startBuldRow() -> Self {
        uiBuild()
        return self
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func uiBuild() {
        
        formRowList.removeAll()
        if rowTitleList.count != rowCount && rowTitleList.count != 0{
            print("JLEasyFormLog：标题名称数组数量与行数不一致无法创建")
            return
        }
        if rowHeightList.count != rowCount && rowHeightList.count != 0{
            print("JLEasyFormLog：行高数组数量与行数不一致无法创建")
            return
        }
        
        var yPoint = 0.0
        for i in 0..<rowCount {
              
            var rowHeightForOne = rowHeight
            var rowWidthForOne = self.bounds.size.width
            var leftMarginForOne = leftTitleMargin
            
            if rowHeightList.count != 0 {
                rowHeightForOne = rowHeightList[i]
            }
            if rowWidth != 0{
                rowWidthForOne = CGFloat(rowWidth)
            }
            
            let rowView = UIView(frame: CGRect(x: 0, y:  CGFloat(yPoint), width: rowWidthForOne, height: CGFloat(rowHeightForOne)))
            addSubview(rowView)
            rowView.backgroundColor = rowBGColor
            
            
            let rowLine = UIView(frame: CGRect(x: 0, y: CGFloat(rowHeightForOne) - 1, width: rowWidthForOne, height: 1))
            if rowLineWidth != 0.0{
                rowLine.frame = CGRect(x: (Double(rowWidthForOne) - rowLineWidth)/2, y: Double(rowHeightForOne - 1), width: rowLineWidth, height: 1.0)
            }
            rowLine.backgroundColor = rowLineColor
            rowView.addSubview(rowLine)
            
            
            if rowTitleList.count != 0 {
                let leftTitle = UILabel()
                rowView.addSubview(leftTitle)
                leftTitle.text = rowTitleList[i]
                leftTitle.font = leftTitleLabelFont
                leftTitle.textColor = leftTitleLabelColor
                let textMaxSize = CGSize(width: 240, height: CGFloat(rowHeightForOne))
                let textLabelSize = textSize(text:rowTitleList[i] , font: leftTitleLabelFont, maxSize: textMaxSize)

                leftTitle.frame = CGRect(origin: CGPoint(x: CGFloat(leftTitleMargin), y: (CGFloat(rowHeightForOne) - textLabelSize.height)/2), size: textLabelSize)
                leftTitle.adjustsFontSizeToFitWidth = true
            }
            
            yPoint += rowHeightForOne
 
            formRowList.append(rowView)
        }

    }

    
    func textSize(text : String , font : UIFont , maxSize : CGSize) -> CGSize{
        return text.boundingRect(with: maxSize, options: [.usesLineFragmentOrigin], attributes: [NSAttributedString.Key.font : font], context: nil).size
    }

}
