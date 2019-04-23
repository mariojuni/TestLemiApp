//
//  ViewController.swift
//  TestLemiApp
//
//  Created by Mario Juni on 22/04/2019.
//  Copyright © 2019 VeritasPay Inc. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var lblLocation: UILabel!
    var strLocation: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        lblLocation.text = strLocation
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
          self.navigationItem.setHidesBackButton(true, animated:false)
    }

}

