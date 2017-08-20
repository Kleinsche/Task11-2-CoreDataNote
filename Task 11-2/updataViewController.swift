//
//  updataViewController.swift
//  Task 11-2
//
//  Created by 🍋 on 2017/1/21.
//  Copyright © 2017年 🍋. All rights reserved.
//

import UIKit
import CoreData

class updataViewController: UIViewController {
    @IBOutlet var note: UITextView!
    var data:NSManagedObject!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        note.becomeFirstResponder()
        note.text = data.value(forKey: "note") as! String!
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func saveAction(_ sender: Any) {
        
        if note.text != "" {
            self.navigationController?.popViewController(animated: true)
            
            data.setValue(note.text, forKey: "note")
            do {
                try data.managedObjectContext?.save()
            } catch let error {
                print(error)
            }
            
        } else {
            
            let alert = UIAlertController(title: "提示", message: "请输入内容", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction.init(title: "确定", style: UIAlertActionStyle.cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
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
