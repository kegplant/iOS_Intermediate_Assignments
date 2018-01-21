//
//  SecondViewController.swift
//  MadLibs
//
//  Created by Song on 1/20/18.
//  Copyright © 2018 Song. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet var textFields: [UITextField]!
    weak var delegate:SecondViewControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func submitButtonPressed(_ sender: UIButton) {
        var inputTexts:[String]=[]
        for textField in textFields {
            if let inputText = textField.text {
                if inputText.count > 0 {
                    print("adding string \(inputText)")
                    inputTexts.append(inputText)
                }
            }
        }
        if inputTexts.count == 4{
            delegate?.SecondViewController(inputTexts: inputTexts)
            dismiss(animated: true, completion: nil)
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
