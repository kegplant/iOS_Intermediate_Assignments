//
//  ViewController.swift
//  BucketList
//
//  Created by Song on 1/17/18.
//  Copyright © 2018 Song. All rights reserved.
//

import UIKit

class BucketListTableViewController: UITableViewController, AddMissionTableViewControllerDelegate {

    var missions=["Earn 2 Mils","Travel to Mars"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return missions.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "MissionCell", for: indexPath)
        cell.textLabel!.text=missions[indexPath.row]
        return cell
    }
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        performSegue(withIdentifier: "EditMissionSegue", sender: indexPath)
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "EditMissionSegue", sender: indexPath)
        print("did select row")
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "EditMissionSegue" {
            let navigationController = segue.destination as! UINavigationController
            let controller = navigationController.topViewController as! AddMissionTableViewController
            controller.delegate = self
            if let indexPath = sender as? IndexPath {
                controller.stringFromSegue = missions[indexPath.row]
                controller.indexPathFromSegue = indexPath
            }
//            else if let cell = sender as? UITableViewCell{//which function is calling this segue???
//                controller.stringFromSegue = cell.textLabel?.text
//                controller.indexPathFromSegue = tableView.indexPath(for: cell)
//            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func addMissionViewController(controller: AddMissionTableViewController, didFinishAddingItem item: String, at indexPath:IndexPath?) {
        if let index = indexPath?.row {
            missions[index]=item
        }else {
            missions.append(item)
        }
        dismiss(animated: true, completion: nil)
        tableView.reloadData()
    }
    func addMissionViewController(controller: AddMissionTableViewController, didPressCancelButton button: UIBarButtonItem) {
        print("dismissing")
        dismiss(animated: true,completion:nil)
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        missions.remove(at: indexPath.row)
        tableView.reloadData()
    }
}

