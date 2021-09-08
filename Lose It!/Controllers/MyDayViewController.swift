//
//  MyDayViewController.swift
//  Lose It!
//
//  Created by Abeer Nasir on 07/09/2021.
//

import Foundation
import UIKit

class MyDayViewController: UIViewController{

    @IBOutlet weak var inputTextField: UITextField!
    
    var datePicker: UIDatePicker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        datePicker = UIDatePicker()
        datePicker!.datePickerMode = .date
        datePicker?.addTarget(self, action: #selector(MyDayViewController.dateChanged(datePicker:)), for: .valueChanged)
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(MyDayViewController.viewTapped(gestureRecognizer:)))
        
        view.addGestureRecognizer(tapGesture)
        
        inputTextField.inputView = datePicker
    }
    
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer){
        view.endEditing(true)
    }
    
    @objc func dateChanged(datePicker: UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        inputTextField.text = dateFormatter.string(from:datePicker.date)
        view.endEditing(true)
    }

}

