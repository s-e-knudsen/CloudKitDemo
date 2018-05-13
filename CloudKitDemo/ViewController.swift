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
        //let privateDatabase = contariner.privateCloudDatabase
        //let sharedDatabase = contariner.sharedCloudDatabase
        
        //Creating a record ID in CloudKit
        let artworkRecordID = CKRecordID(recordName: "115")
        
        //Create a Record object
        let artworkRecord = CKRecord(recordType: "Artwork", recordID: artworkRecordID)
        
        //Sets the fealds in the redord
        artworkRecord["title"] = "MacKerricher State Perk" as NSString
        artworkRecord["artist"] = "Mei Chen" as NSString
        artworkRecord["address"] = "Fort Bragg, CA" as NSString
        
        //Save the recoed to Cloudkit
        publicDatabase.save(artworkRecord) { (record, error) in
            if let error = error {
                print(error)
                return
                
            } else {
                print("record saved successuly")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

