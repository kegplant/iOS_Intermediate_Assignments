//
//  ViewController.swift
//  NorthEastSouthWest
//
//  Created by Song on 1/19/18.
//  Copyright © 2018 Song. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func buttonPressed(_ sender: UIButton) {
        print("button pressed")
        performSegue(withIdentifier: "directionSegue", sender: sender)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        print("preparing for \(sender)")
        let destination = segue.destination as! DestinationViewController
        if let button = sender as? UIButton{
            if let label = button.titleLabel{
                destination.direction=label.text
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

