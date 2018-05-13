//
//  ViewController.swift
//  CloudKitDemo
//
//  Created by Søren Knudsen on 12/05/2018.
//  Copyright © 2018 Søren Knudsen. All rights reserved.
//
//This is a cloudkit demo to lear it better.

import UIKit
import CloudKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Init of CloudKit
        
        let contariner = CKContainer.default()
        let publicDatabase = contariner.publicCloudDatabase
        let privateDatabase = contariner.privateCloudDatabase
        let sharedDatabase = contariner.sharedCloudDatabase
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

