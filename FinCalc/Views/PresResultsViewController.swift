//
//  PresResultsViewController.swift
//  FinCalc
//
//  Created by Alex Wigsmoen on 2/17/22.
//

import UIKit

class PresResultsViewController: UIViewController {
    
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
    
}
