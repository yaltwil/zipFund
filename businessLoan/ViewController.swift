//
//  ViewController.swift
//  businessLoan
//
//  Created by Yazan Altwil on 5/19/17.
//  Copyright © 2017 Yazan Altwil. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import CoreData

struct myTerms {
    let term:String!
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, NSFetchedResultsControllerDelegate {
    
    
    var bankTerms = [myTerms]()
    var controller: NSFetchedResultsController<OperatingProfit>!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        termDefinitions()
        
    /********************************************* Firebase data output ***************************************/
        // Use to describe the terms that'll get selected from the table view
        let dataBaseRef = Database.database().reference()
        
//        dataBaseRef.child("Terms").queryOrderedByKey().observe(.childAdded, with: {
//            snapshot in
//            let snapshotValue = snapshot.value as? NSDictionary
//            let term = snapshotValue?["Inventory"]
//            self.bankTerms.insert(myTerms(term: term as? String), at: 0)
//            self.tableView.reloadData()
//        })
        dataBaseRef.child("Categories").queryOrderedByKey().observe(.childAdded, with: {
            snapshot in
            let snapshotValue = snapshot.value as? NSDictionary
            let term = snapshotValue?["GrossReceipts"]
            self.bankTerms.insert(myTerms(term: term as? String), at: 0)
            self.tableView.reloadData()
        })
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    /************************************************ Table Function *****************************************/
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return bankTerms.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! mainCell
        cell.cellLabel.text = bankTerms[indexPath.row].term
        return cell
    }
    
    
    /********************************************* Firebase data input ***************************************/
    func termDefinitions() {
        let term = "Term"
        let definition = "defintion"
        
//        let terms: [String : String] = [term:definition, "Inventory": "This is your inventory costs"]
//        let dataBaseRef = Database.database().reference()
//        
//        dataBaseRef.child("Terms").childByAutoId().setValue(terms)
        
        let terms: [String : String] = [term:definition, "Inventory": "This is your inventory costs"]
        let dataBaseRef = Database.database().reference()
        
        dataBaseRef.child("Categories").childByAutoId().setValue(terms)
    }
    
    
    func fetchData() {
        let fetchRequest:NSFetchRequest<OperatingProfit> = OperatingProfit.fetchRequest()
        
        self.controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        do {
            try controller.performFetch()
        } catch {
            let error = error as NSError
            print("\(error)")
        }
    }

    func fillCell(cell: mainCell, indexPath: NSIndexPath) {
//        let currentCell = controller.object(at: indexPath as IndexPath)
//        let userInput = OperatingProfit(context: context)
//        userInput.incomeTaxes = cell.getInputOne()
//        
//        appDel.saveContext()


    }



    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

