//
//  TableViewController.swift
//  Task 11-2
//
//  Created by 🍋 on 2017/1/18.
//  Copyright © 2017年 🍋. All rights reserved.
//

import UIKit
import CoreData

class TableViewController: UITableViewController {
    var context:NSManagedObjectContext!
    var arr:Array<Any>!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         self.navigationItem.leftBarButtonItem = self.editButtonItem
        
       context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        refresh()
    }

    func refresh() {
        let f = NSFetchRequest<NSFetchRequestResult>(entityName: "Notes")
        do {
            arr = try context.fetch(f)
        } catch let error {
            print(error)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arr.count
    }
    
    override func viewWillAppear(_ animated: Bool) {
        refresh()
        tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let data = arr[indexPath.row] as! NSManagedObject
//       let vc = storyboard?.instantiateViewController(withIdentifier: "updataViewController") as! updataViewController
//        vc.data = data
//        present(vc, animated: true, completion: nil)
        print(self.tableView.indexPathForSelectedRow!.row)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mycell", for: indexPath)
        let label = cell.viewWithTag(2) as! UILabel
        label.text = (arr[indexPath.row] as! NSManagedObject).value(forKey: "note") as? String

        return cell
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            context.delete(arr[indexPath.row] as! NSManagedObject)
            do {
                try context.save()
                refresh()
                tableView.reloadData()
            } catch let error {
                print(error)
            }
            
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "updata" {
            let vc = segue.destination as! updataViewController
            vc.data = arr[self.tableView.indexPathForSelectedRow!.row] as! NSManagedObject
        }
    }
    

}
