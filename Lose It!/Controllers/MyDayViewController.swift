//
//  MyDayViewController.swift
//  Lose It!
//
//  Created by Abeer Nasir on 07/09/2021.
//

import Foundation
import UIKit

let notificationKey = "com.Abeer.notificationKey"
class MyDayViewController: UIViewController{

    var caloriesVal: String?
    var remainingVal : Int = 0
    var totalCal : Int = 0
    var myDayCals : Int = 0
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var remainingLabel: UILabel!
    var datePicker: UIDatePicker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        remainingLabel.text = caloriesVal
        let datePicker = UIDatePicker()
        datePicker .datePickerMode = .date
        datePicker.addTarget(self, action: #selector(dateChanged(datePicker:)), for:UIControl.Event.valueChanged)
        datePicker.frame.size = CGSize(width: 0, height: 300)
        datePicker.preferredDatePickerStyle = .wheels
        
        inputTextField.inputView = datePicker
        inputTextField.text = formatDate(date: Date())
    
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(MyDayViewController.viewTapped(gestureRecognizer:)))
        
        view.addGestureRecognizer(tapGesture)
        
        NotificationCenter.default.addObserver(self, selector: #selector(doWhenNotify(_:)), name: Notification.Name(rawValue: notificationKey), object: nil)
        
      
    }
   
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer){
        view.endEditing(true)
    }
    
    @objc func dateChanged(datePicker: UIDatePicker){
        inputTextField.text = formatDate(date: datePicker.date)
    }
 
    

    func formatDate(date: Date)-> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        return formatter.string(from: date)
}
    @objc func doWhenNotify(_ notification: NSNotification){

        
        if let dict = notification.userInfo as NSDictionary? {
            if let total = dict["total"] as? String{
                remainingVal = Int(caloriesVal!)!
                myDayCals = remainingVal - Int(total)!
                remainingLabel.text = String(myDayCals)
            }
    }
    
    

}

}
