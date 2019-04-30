//
//  ViewController.swift
//  TestLemiApp
//
//  Created by Mario Juni on 22/04/2019.
//  Copyright © 2019 VeritasPay Inc. All rights reserved.
//

import UIKit


class MainViewController: UIViewController , ChildViewController{
    func getLocation(loc: String) {
        lblLocation.text = loc
    }
    
    @IBOutlet weak var lblLocation: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "prepareToSearch"{
        let nextVC = segue.destination as! SearchTableViewController
            nextVC.delegate = self
        }
    }
   
}

