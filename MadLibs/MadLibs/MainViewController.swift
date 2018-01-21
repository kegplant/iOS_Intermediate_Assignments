//
//  ViewController.swift
//  MadLibs
//
//  Created by Song on 1/19/18.
//  Copyright © 2018 Song. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var madlibLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destionation = segue.destination as! SecondViewController
        destionation.delegate=self
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
extension MainViewController: SecondViewControllerDelegate{
    func SecondViewController(inputTexts words: [String]) {
        madlibLabel.text = "We are having a perfectly \(words[0]) time now. Later we will \(words[1]) and \(words[2]) in the \(words[3])."
    }
}
