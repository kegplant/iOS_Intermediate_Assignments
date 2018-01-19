//
//  DestinationViewController.swift
//  NorthEastSouthWest
//
//  Created by Song on 1/19/18.
//  Copyright © 2018 Song. All rights reserved.
//

import UIKit

class DestinationViewController: UIViewController {
    var direction:String?
    @IBOutlet weak var directionButton: UIButton!
    @IBAction func destinationButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func unwindToViewControllerNameHere(segue: UIStoryboardSegue) {
        //nothing goes here
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        directionButton.setTitle(direction,for:.normal)
        // Do any additional setup after loading the view.
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
