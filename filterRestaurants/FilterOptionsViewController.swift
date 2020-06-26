//
//  FilterOptionsViewController.swift
//  filterRestaurants
//
//  Created by Kaitlyn VanHook on 6/25/20.
//  Copyright © 2020 Kaitlyn VanHook. All rights reserved.
//

import UIKit

class FilterOptionsViewController: UIViewController {

    var restaurants : [Restaurant] = []
    var results : [Restaurant] = []
    
    @IBOutlet weak var veganSwitch: UISwitch!
    
    @IBOutlet weak var farmSwitch: UISwitch!
    
    @IBOutlet weak var sustainableSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        restaurants = createListOfRestaurants()
        
        // Do any additional setup after loading the view.
    }
    
    func createListOfRestaurants () -> [Restaurant] {
        
        
        let graze = Restaurant(restaurantName: "Graze Nashville", restaurantAddress: "1888 Eastland Ave", hasTags: ["vegan"])
        let wildCow = Restaurant(restaurantName: "The Wild Cow", restaurantAddress: "1100 Fatherland St", hasTags: ["vegan", "farm to table"])
        let eRose = Restaurant(restaurantName: "E+ROSE", restaurantAddress: "211 3rd Ave S", hasTags: ["sustainable packaging"])
        let rosePepper = Restaurant(restaurantName: "Rosepepper", restaurantAddress: "1907 Eastland Ave", hasTags: [])
        let avo = Restaurant(restaurantName: "AVO", restaurantAddress: "3 City Ave", hasTags: ["vegan", "farm to table", "sustainable packaging"])
        
        return[graze, wildCow, eRose, rosePepper, avo]
    }
    
    @IBAction func resultsFilter(_ sender: Any) {
        results.removeAll()
        
        
        if veganSwitch.isOn && farmSwitch.isOn && sustainableSwitch.isOn {
            results.append(contentsOf: restaurants.filter { $0.tag.contains("vegan") && $0.tag.contains("farm to table") && $0.tag.contains("sustainable packaging") })
        } else if veganSwitch.isOn && farmSwitch.isOn {
            results.append(contentsOf: restaurants.filter { $0.tag.contains("vegan") && $0.tag.contains("farm to table") })
        } else if veganSwitch.isOn {
            results.append(contentsOf: restaurants.filter { $0.tag.contains("vegan") })
        } else if farmSwitch.isOn && sustainableSwitch.isOn {
            results.append(contentsOf: restaurants.filter { $0.tag.contains("farm to table") && $0.tag.contains("sustainable packaging") })
        } else if farmSwitch.isOn {
            results.append(contentsOf: restaurants.filter { $0.tag.contains("farm to table") })
        } else if sustainableSwitch.isOn {
            results.append(contentsOf: restaurants.filter { $0.tag.contains("sustainable packaging")})
        } else {
            results = restaurants
        }
        
        
        
        performSegue(withIdentifier: "showResults", sender: self)
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        
        let vc = segue.destination as! ResultsTableViewController
        vc.finalResults = results
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
