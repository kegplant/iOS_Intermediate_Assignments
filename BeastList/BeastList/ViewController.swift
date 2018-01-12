//
//  ViewController.swift
//  BeastList
//
//  Created by Song on 1/11/18.
//  Copyright © 2018 Song. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var tasks = ["Exercise for 30 minutes", "Wireframe for some project", "Do laundry"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource=self
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func beastButtonPressed(_ sender: UIButton) {
        // your code here
        if let newTask = taskTextField.text {
            tasks.append(newTask)
            taskTextField.text=""
        }
        // Add the textField text as an item to the array
        // reload the table view data
        tableView.reloadData()
    }
}
extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) ->  Int {
        // return an integer that indicates how many rows (cells) to draw
        return tasks.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Get the UITableViewCell and cre ate/populate it with data then return it
        let cell=tableView.dequeueReusableCell(withIdentifier: "MyCell", for:indexPath)
        cell.textLabel?.text=tasks[indexPath.row]
        return cell
    }
}

