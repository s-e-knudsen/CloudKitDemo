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
        let artworkRecordID = CKRecordID(recordName: "116")
        
        //Create a Record object
        let artworkRecord = CKRecord(recordType: "Artwork", recordID: artworkRecordID)
        var newDataRecord = CKRecord(recordType: "Artwork")
        //Sets the fealds in the redord
        artworkRecord["title"] = "MacKerricher State Perk" as NSString
        artworkRecord["artist"] = "Mei Chen" as NSString
        artworkRecord["address"] = "Fort Bragg, CA" as NSString
        
        
        //Save the recoed to Cloudkit
//        publicDatabase.save(artworkRecord) { (record, error) in
//            if let error = error {
//                print(error)
//                return
//
//            } else {
//                print("Adding record")
//                print("record saved successuly")
//                print(artworkRecord)
//            }
//        }
        
        //Fetching a Cloudkit record. This ID 116. And adding a date on it.
        publicDatabase.fetch(withRecordID: artworkRecordID) { (record, error) in
            if let error = error {
                print(error)
            } else {
                print("The rocord is:")
                print(record ?? "defauld value")
                //artworkRecord.setValue("test", forKey: "title")
               
                print(record?["title"] ?? "empty")
                newDataRecord = record!
                print(newDataRecord["title"] ?? "test")
                newDataRecord.setValue("testing my code", forKey: "title")
                publicDatabase.save(newDataRecord, completionHandler: { (record, error) in
                    if let error = error {
                        print(error)
                    } else {
                        print("saved successfully")
                        print(newDataRecord["title"] ?? "none")
                    }
                })
           
                
                
                
            }
            
        }
        
        //Updsate the record
        
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

