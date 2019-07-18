//
//  SecondViewController.swift
//  Student
//
//  Created by Boon on 16/07/19.
//  Copyright © 2019 Boon. All rights reserved.
//

import UIKit

//protocol segueProtocol {
//    func fetchData()
//}

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //MARK:- Variables
    //var delegate: segueProtocol?
    var studentDataArray:[StudentDataModel] = []
    
    //MARK:- IBOutlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var sectionLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var phLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    //MARK:-View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "MyTableCell", bundle: nil), forCellReuseIdentifier: "MyTableCell")
        print("36 SVC", studentDataArray)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("2nd view will appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("2nd View will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("2nd View did disappear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("2nd View did appear")
    }
    
    //MARK:- Public methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("no of vals in array", studentDataArray.count)
        return studentDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyTableCell", for: indexPath) as! MyTableCell
        
        let n = studentDataArray.count -  indexPath.row - 1 //for reverse order of DataArray
        
        cell.labelName.text = studentDataArray[n].nameVal
        cell.labelSection.text = studentDataArray[n].sectionVal
        cell.labelAge.text = String(studentDataArray[n].ageVal)
        cell.labelPh.text = String(studentDataArray[n].phoneVal)
        
        return cell
    }
}
