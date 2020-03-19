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
    var rowCount = 0
    
    var leftTitleMargin = 20.0
    var leftTitleLabelFont = UIFont.systemFont(ofSize: 14)
    
    var formRowList:Array<UIView> = Array()
    
    
    @discardableResult func setRowCount(count: Int) -> Self {
        self.rowCount = count
        return self
    }
    //行列背景色
    @discardableResult func setRowBGColor(color: UIColor) -> Self {
        self.rowBGColor = color
        return self
    }
    @discardableResult func setRowLineColor(color: UIColor) -> Self {
        self.rowLineColor = color
        return self
    }
    //行高
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
    //行宽
    @discardableResult func setRowWidth(width: Double) -> Self {
        self.rowWidth = Double(width)
        return self
    }
    //标题左侧边距
    @discardableResult func setLeftTitleMargin(margin: Double) -> Self {
        self.leftTitleMargin = Double(margin)
        return self
    }
    //标题文字Font
    @discardableResult func setLeftTitleLabelFont(font: UIFont) -> Self {
        self.leftTitleLabelFont = font
        return self
    }
    //标题数组
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
            var rowWidthForOne = self.width
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
            
            let rowLine = UIView(frame: CGRect(x: 0, y: rowView.height - 1, width: rowWidthForOne, height: 1))
            rowLine.backgroundColor = rowLineColor
            rowView.addSubview(rowLine)
            
            
            if rowTitleList.count != 0 {
                let leftTitle = UILabel()
                rowView.addSubview(leftTitle)
                leftTitle.text = rowTitleList[i]
                leftTitle.font = leftTitleLabelFont
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


public extension UIView {
    
    var x: CGFloat {
        set {
            frame.origin.x = newValue
        }
        get {
            return frame.origin.x
        }
    }
    
    var y: CGFloat {
        set {
            frame.origin.y = newValue
        }
        get {
            return frame.origin.y
        }
    }
    
    var height: CGFloat {
        set {
            frame.size.height = newValue
        }
        get {
            return frame.size.height
        }
    }
    
    var width: CGFloat {
        set {
            frame.size.width = newValue
        }
        get {
            return frame.size.width
        }
    }
    
    var halfH: CGFloat {
        get {
            return height / 2.0
        }
    }
    
    var halfW: CGFloat {
        get {
            return width / 2.0
        }
    }
    
    var right: CGFloat {
        set {
            x = newValue - width
        }
        get {
            return x + width
        }
    }
    
    var left: CGFloat {
        set {
            x = newValue
        }
        get {
            return x
        }
    }
    
    var bottom: CGFloat {
        set {
            y = newValue - height
        }
        get {
            return y + height
        }
    }
    
    var centerX: CGFloat {
        set {
            center.x = newValue
        }
        get {
            return center.x
        }
    }
    
    var centerY: CGFloat {
        set {
            center.y = newValue
        }
        get {
            return center.y
        }
    }
    
    var radius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
    
    var borderW: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
}
