//
//  ViewController.swift
//  realmPractice
//
//  Created by ta_fukase on 2019/03/06.
//  Copyright © 2019 ta_fukase. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
  
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    var currentEnteredName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        nameTextField.delegate = self
        view.backgroundColor = .red
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let realm = try! Realm()
        let scoreData = realm.objects(Score.self)
        
        return scoreData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let realm = try! Realm()
        let scoreData = realm.objects(Score.self)
        
        // セルを取得する
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "sampleCell", for: indexPath)
        
        cell.textLabel!.text = scoreData[indexPath.row].name
        
        return cell
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        let enteredName = textField.text!
        
        currentEnteredName = enteredName
        
        textField.resignFirstResponder()
        
        return true
    }
    
    @IBAction func add(_ sender: Any) {
        
        let realm = try! Realm()
        
        let scoreObject = Score()
        scoreObject.name = currentEnteredName
        scoreObject.score = 100
        
        try! realm.write() {
            realm.add(scoreObject)
        }
    }
    
    @IBAction func updateCells(_ sender: Any) {

        tableView.reloadData()
    }
    
    @IBAction func deleteOnData(_ sender: Any) {

        // Realmのインスタンスを取得
        let realm = try! Realm()
        
        // Realmに保存されてるデータをすべて取得
        let tests = realm.objects(Score.self)
        
        // 一番前のデータを取得
        if let test = tests.first {
            
            // 削除
            try! realm.write() {
                realm.delete(test)
            }
        }
    }
}


