//
//  ViewController.swift
//  BucketList
//
//  Created by Song on 1/17/18.
//  Copyright © 2018 Song. All rights reserved.
//

import UIKit
import CoreData

class BucketListTableViewController: UITableViewController, AddMissionTableViewControllerDelegate {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var missions:[BucketList]=[]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //do context again? or no need
        missions=fetch()
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return missions.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "MissionCell", for: indexPath)
        cell.textLabel!.text=missions[indexPath.row].mission
        return cell
    }
    func fetch()->[BucketList]{
        let bucketlistRequest:NSFetchRequest<BucketList> = BucketList.fetchRequest()
        do {
            let fetchedMissions = try context.fetch(bucketlistRequest)
            return fetchedMissions
        }
        catch {
            print("fetch error: ")
            print(error)
            return []
        }
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
                controller.stringFromSegue = missions[indexPath.row].mission
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
            missions[index].mission=item
        }else {
            let newMission=BucketList(context:context)
            newMission.mission=item
            missions.append(newMission)
        }
        missionSave()
        dismiss(animated: true, completion: nil)
        tableView.reloadData()
    }
    func addMissionViewController(controller: AddMissionTableViewController, didPressCancelButton button: UIBarButtonItem) {
        print("dismissing")
        dismiss(animated: true,completion:nil)
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        context.delete(missions[indexPath.row])
        missionSave()
        missions.remove(at: indexPath.row)
        tableView.reloadData()
        
    }
    func missionSave(){
        do{
            try context.save()
        } catch{
            print("core data save error: ")
            print(error)
        }
    }
}

