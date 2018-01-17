//
//  ViewController.swift
//  AgingPeople
//
//  Created by Song on 1/17/18.
//  Copyright © 2018 Song. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var people=["Alice","Bob","Clair","Dan","Felix","Elise"]
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
extension ViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "PeopleWithAge",for:indexPath)
        cell.textLabel?.text=people[indexPath.row]
        cell.detailTextLabel?.text=String(arc4random()%91+5)+" years old"
        return cell
    }
    
}
