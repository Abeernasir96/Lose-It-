//
//  CalorieManager.swift
//  Lose It!
//
//  
//

import Foundation

protocol CalorieManagerDelegate {
    func didUpdateCalorie(_ calorieManager:CalorieManager, calorie:CalorieModel)
}
 

struct CalorieManager {
    let calorieURL = "https://api.nutritionix.com/v1_1/search/"
    let fields = "?results=0:20&fields=item_name,brand_name,item_id,nf_calories"
    let apiKEY = "&appId=0ddea116&appKey=4c7b2802af333bce4658c3fe891e795c"

    var delegate: CalorieManagerDelegate?

func fetchCalorie (foodName: String){
    let urlString = "\(calorieURL)\(foodName)\(fields)\(apiKEY)"
    self.performRequest(with: urlString )
    print(urlString)
}
    func performRequest(with urlString: String){
        if let url = URL(string: urlString){
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil{
                    print(error!)
                    return
                }
                if let safeData = data{
                let calorie = self.parseJSON( safeData)
                    self.delegate?.didUpdateCalorie(self, calorie: calorie!)
                    
            }
            }
            task.resume()
            
        }
    }
        
        
        func parseJSON(_ calorieData: Data)-> CalorieModel?{
            let decoder = JSONDecoder()
            do{
          let decodedData = try decoder.decode(CalorieData.self, from: calorieData)
               let nfCalories = decodedData.hits[0].fields.nf_calories
                let itemName = decodedData.hits[0].fields.item_name
                
                let calorie = CalorieModel(nfCals: nfCalories, item: itemName)
                print(calorie.CalorieString)
                return calorie
    
            }
            catch{
                print(error)
                return nil
            }
            
            
        }
    }
    

