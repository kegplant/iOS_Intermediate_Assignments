//
//  AddMissionViewController.swift
//  BucketList
//
//  Created by Song on 1/17/18.
//  Copyright © 2018 Song. All rights reserved.
//

import UIKit

class AddMissionTableViewController: UITableViewController {
//    @IBOutlet weak var newMissionText: UITextField!
    
    @IBOutlet weak var newMissionText: UITextField!
    
    weak var delegate: AddMissionTableViewControllerDelegate?
    var indexPathFromSegue:IndexPath?
    var stringFromSegue:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newMissionText.text=stringFromSegue
        // Do any additional setup after loading the view.
    }

    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        delegate?.addMissionViewController(controller: self, didPressCancelButton: sender)
//        while(true){print("cancel button pressed")}
    }
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        if let newMission=newMissionText.text {
//            print(indexPathFromSegue?.row)
            delegate?.addMissionViewController(controller: self, didFinishAddingItem: newMission,at:indexPathFromSegue)
            newMissionText.text=nil //can do this but don't have to
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
