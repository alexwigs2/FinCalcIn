//
//  ResultsViewController.swift
//  FinCalc
//
//  Created by Alex Wigsmoen on 2/15/22.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var finAnswer: UILabel!
    @IBOutlet weak var sumarryLabel: UILabel!
    
    @IBOutlet weak var cal: UIButton!
    
    var total: String?
    var summary: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cal.layer.cornerRadius = 25.0
        cal.layer.borderWidth = 2
        cal.layer.borderColor = UIColor.blue.cgColor
        cal.tintColor = UIColor.blue

        finAnswer.text = total
        sumarryLabel.text = summary
    }
    

    @IBAction func recalculatePressed(_ sender: UIButton) {
        
            self.dismiss(animated: true, completion: nil)
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
