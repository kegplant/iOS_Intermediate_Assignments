//
//  ViewController.swift
//  BinaryCounter
//
//  Created by Song on 1/18/18.
//  Copyright © 2018 Song. All rights reserved.
//

import UIKit

class BinaryCounterViewController: UITableViewController, CustomCellDelegate {
    func CustomCell(from cell: CustomCell, didPressAction: String) {
        print(didPressAction+" "+(cell.textLabel2.text)!)
        if didPressAction == "plus" {
            total += Int(cell.textLabel2.text!)!
        }else if didPressAction == "minus" {
            total -= Int(cell.textLabel2.text!)!
        }
        tableView.reloadData()
//        cell.textLabel2.text=String(total)
    }
    
    var rows=17
    var total=0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView?.frame = CGRect(x:(tableView.tableFooterView?.frame.origin.x)!, y:(tableView.tableFooterView?.frame.origin.y)!, width:(tableView.tableFooterView?.frame.width)!, height: 300)
        // Do any additional setup after loading the view, typically from a nib.
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.row < rows ){
            let cell=tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
            cell.textLabel2.text="\(pow(10,indexPath.row))"
            cell.delegate = self
            return cell
        }else{//works but not as good as footer
            let cell=tableView.dequeueReusableCell(withIdentifier: "BasicCell", for: indexPath)
            cell.textLabel?.text = "Total:\(total)"
            return cell
        }
    }
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let v=UILabel()
        v.text="Total:\(total)"
        v.font = UIFont(name: v.font.fontName, size: 50)
        print("setting font size to \(v.font)")
        v.backgroundColor=UIColor.purple
        v.frame = CGRect(x:v.frame.origin.x, y:v.frame.origin.y, width:280, height: 300)
        tableView.tableFooterView = v
//        v.
        //        v.fonts
        return v

        //this did not work
//        let paragraphStyle = NSMutableParagraphStyle()
//        //line height size
//        paragraphStyle.lineSpacing = 5
//        let attrString = NSMutableAttributedString(string: "ABC")
//        attrString.addAttribute(NSAttributedStringKey.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attrString.length))
//        v.attributedText = attrString
    }
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 50
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

