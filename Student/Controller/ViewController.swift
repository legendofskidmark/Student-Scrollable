//
//  ViewController.swift
//  Student
//
//  Created by Boon on 16/07/19.
//  Copyright © 2019 Boon. All rights reserved.
//

import UIKit

//Implemented scrollView in storyboard with ref to : https://www.youtube.com/watch?v=nfHBCQ3c4Mg
class ViewController: UIViewController, UITextFieldDelegate {
    
    //MARK:- Variables
    var dataModelArray:[StudentDataModel] = []
    
    //MARK:- IBOutlets
    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textFieldSection: UITextField!
    @IBOutlet weak var textFieldAge: UITextField!
    @IBOutlet weak var textFieldPh: UITextField!
    @IBOutlet weak var textFieldFlang: UITextField!
    @IBOutlet weak var textFieldSlang: UITextField!
    @IBOutlet weak var textFieldLang: UITextField!
    @IBOutlet weak var textFieldRegion: UITextField!
    @IBOutlet weak var textFieldHobby: UITextField!
    @IBOutlet weak var textFieldID1: UITextField!
    @IBOutlet weak var textFieldID2: UITextField!
    @IBOutlet weak var myScrollView: UIScrollView!
    
    //MARK:- IBAction
    @IBAction func submitPressed(_ sender: Any) {
        userEnteredData()
        textFieldName.text = ""
        textFieldSection.text = ""
        textFieldAge.text = ""
        textFieldPh.text = ""
        textFieldFlang.text = ""
        textFieldSlang.text = ""
        textFieldLang.text = ""
        textFieldRegion.text = ""
        textFieldHobby.text = ""
        textFieldID1.text = ""
        textFieldID2.text = ""
    }
    
    @IBAction func nextPressed(_ sender: Any) {
        performSegue(withIdentifier: "mySegue", sender: self)
    }
    
    //MARK:- App lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        print("view did load")
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(clickedSomewhere))
        self.view.addGestureRecognizer(tapGesture)
        // Do any additional setup after loading the view.
        
        
        // ref for below two lines : https://www.youtube.com/watch?v=D3sxanj3vd8
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardAdjust), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardAdjust), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: self, action: nil)
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(clickedSomewhere))
        
        toolBar.setItems([flexibleSpace, doneButton], animated: true)
        
        textFieldName.inputAccessoryView = toolBar
        textFieldSection.inputAccessoryView = toolBar
        textFieldAge.inputAccessoryView = toolBar
        textFieldPh.inputAccessoryView = toolBar
        textFieldFlang.inputAccessoryView = toolBar
        textFieldSlang.inputAccessoryView = toolBar
        textFieldLang.inputAccessoryView = toolBar
        textFieldRegion.inputAccessoryView = toolBar
        textFieldHobby.inputAccessoryView = toolBar
        textFieldID1.inputAccessoryView = toolBar
        textFieldID2.inputAccessoryView = toolBar
      }
    
    override func viewWillAppear(_ animated: Bool) {
        print("1st view will appear")
    }

    override func viewWillDisappear(_ animated: Bool) {
        print("1st View will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("1st View did disappear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("1st View did appear")
    }
    
    //MARK:- private methods
    private func userEnteredData() {
        let name:String = textFieldName.text ?? "No name"
        let section:String = textFieldSection.text ?? "No section"
        let age:Int = Int(textFieldAge.text!) ?? 404
        let phone:Int = Int(textFieldPh.text!) ?? 500
        let fl:String = textFieldFlang.text ?? ""
        let sl:String = textFieldSlang.text ?? ""
        let myLang:String = textFieldLang.text ?? ""
        let myRegion:String = textFieldRegion.text ?? ""
        let hobb:String = textFieldHobby.text ?? ""
        let myID1:String = textFieldID1.text ?? ""
        let myID2:String = textFieldID2.text ?? ""
        
        let dataModel = StudentDataModel(nameVal: name, sectionVal: section, ageVal: age, phoneVal: phone, flang: fl, slang: sl, Lang: myLang, region: myRegion, hobbies: hobb, id1: myID1, id2: myID2)
        
        dataModelArray.append(dataModel)
        print("54 VC", dataModelArray)
    }

    //MARK:- public functions
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mySegue" {
            let destinationVC = segue.destination as! SecondViewController
            destinationVC.studentDataArray = dataModelArray
//            destinationVC.delegate = self
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        switch textField{
            case textFieldName:
                textFieldSection.becomeFirstResponder()
            case textFieldSection:
                textFieldAge.becomeFirstResponder()
            case textFieldAge:
                textFieldPh.becomeFirstResponder()
            case textFieldPh:
                textFieldFlang.becomeFirstResponder()
            case textFieldFlang:
                textFieldSlang.becomeFirstResponder()
            case textFieldSlang:
                textFieldLang.becomeFirstResponder()
            case textFieldLang:
                textFieldRegion.becomeFirstResponder()
            case textFieldRegion:
                textFieldHobby.becomeFirstResponder()
            case textFieldHobby:
                textFieldID1.becomeFirstResponder()
            case textFieldID1:
                textFieldID2.becomeFirstResponder()
            case textFieldID2:
                textFieldID2.resignFirstResponder()
            default:
                print("Hit default case")
            }
        return true
    }
 
    @objc func clickedSomewhere(){
        self.view.endEditing(true)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @objc func keyboardAdjust(notification: Notification){
        
        let userInfo = notification.userInfo!
        
        let keyboardScreenEndFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let keyboardViewEndFrame = view.convert(keyboardScreenEndFrame, from: view.window)
        
        if notification.name == UIResponder.keyboardWillHideNotification {
            myScrollView.contentInset = UIEdgeInsets.zero
        } else {
            myScrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardViewEndFrame.height + 20, right: 0) // bottom : +20 for UIToolBar
        }
        
        myScrollView.scrollIndicatorInsets = myScrollView.contentInset
    }
}
