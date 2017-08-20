//
//  ViewController.swift
//  Task 11-2
//
//  Created by 🍋 on 2017/1/18.
//  Copyright © 2017年 🍋. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    @IBOutlet var note: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        note.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func saveAction(_ sender: Any) {
        if note.text != "" {
            self.navigationController?.popViewController(animated: true)
            
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            let row = NSEntityDescription.insertNewObject(forEntityName: "Notes", into: context)
            row.setValue(self.note.text, forKey: "note")
            do {
                try context.save()
            } catch let error {
                print(error)
            }
            
        } else {
            
           let alert = UIAlertController(title: "提示", message: "请输入内容", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction.init(title: "确定", style: UIAlertActionStyle.cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
    }


}

