//
//  AddItemTableViewControllerDelegate.swift
//  BucketList
//
//  Created by Song on 1/17/18.
//  Copyright © 2018 Song. All rights reserved.
//

import UIKit
protocol AddMissionTableViewControllerDelegate: class{
    func addMissionViewController(controller: AddMissionTableViewController,didFinishAddingItem item: String, at indexpath: IndexPath?)
    func addMissionViewController(controller: AddMissionTableViewController,didPressCancelButton button: UIBarButtonItem)
}
