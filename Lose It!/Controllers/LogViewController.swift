//
//  LogViewController.swift
//  Lose It!
//
//  
//

import UIKit



class LogViewController: UIViewController{

    @IBOutlet weak var breakfastLabel: UILabel!
    @IBOutlet weak var lunchLabel: UILabel!
    @IBOutlet weak var totalCaloriesLabel: UILabel!
    @IBOutlet weak var breakfastButton: UIButton!
    @IBOutlet weak var lunchButton: UIButton!
    @IBOutlet weak var dinnerLabel: UILabel!
    @IBOutlet weak var dinnerButton: UIButton!
    var bfCal : Int = 0
    var dCal : Int = 0
    var lCal : Int = 0
   
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
    }
   
       
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navController = segue.destination as! UINavigationController
        let destController = navController.topViewController as! SearchViewController
        
        
        destController.delagate = self
        if segue.identifier == "bfToSearch"{
            destController.mealType = .breakfast
        }
        if segue.identifier == "lunchToSearch"{
            destController.mealType = .lunch
    }
        if segue.identifier == "dinnerToSearch"{
            destController.mealType = .dinner
        }

     
    }
    
}

extension LogViewController: DataDelegate{
    func updateLogCalories(str: String?, mealType: MealType) {
        if mealType == MealType.breakfast{
            breakfastLabel.text = str
            bfCal = Int(str!)! 
        }else if mealType == MealType.lunch{
            lunchLabel.text = str
            lCal = Int(str!)!
        }else if mealType == MealType.dinner{
            dinnerLabel.text = str
            dCal = Int(str!)!
        }
        let tCal = bfCal + lCal + dCal
        totalCaloriesLabel.text = String(tCal)
        
        var info = [String: String]()
        info["total"] = totalCaloriesLabel.text
        NotificationCenter.default.post(name: Notification.Name(rawValue: notificationKey), object: self, userInfo: info)
        
    }
    
    
                
    }
    
    
    


