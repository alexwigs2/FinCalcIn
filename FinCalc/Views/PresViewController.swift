//
//  PresViewController.swift
//  FinCalc
//
//  Created by Alex Wigsmoen on 2/17/22.
//

import UIKit
import GoogleMobileAds

class PresViewController: UIViewController {

    
    @IBOutlet weak var pvalue: UITextField!
    @IBOutlet weak var inter: UITextField!
    @IBOutlet weak var peri: UITextField!
    @IBOutlet weak var year: UITextField!
    
    @IBOutlet weak var yearbut: UIButton!
    @IBOutlet weak var semibut: UIButton!
    @IBOutlet weak var monthbut: UIButton!
    
    @IBOutlet weak var cal: UIButton!
    
    @IBOutlet weak var bannerView: GADBannerView!
    
    var answer = 0.0
    var t = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        
        cal.layer.cornerRadius = 25.0
        cal.layer.borderWidth = 2
        cal.layer.borderColor = UIColor.blue.cgColor
        cal.tintColor = UIColor.blue
        
        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        
    }
    
    func setUp() {
        let bar = UIToolbar()
        
        let done = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(dismissMy))
        
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        bar.items = [space, space, done]
        bar.sizeToFit()
        
        pvalue.inputAccessoryView = bar
        inter.inputAccessoryView = bar
        peri.inputAccessoryView = bar
        year.inputAccessoryView = bar
    }
    
    @objc func dismissMy(){
        view.endEditing(true)
    }
    
    @IBAction func freqChanged(_ sender: UIButton) {
        
        
        if(sender.currentTitle == yearbut.currentTitle) {
            yearbut.isSelected = true
            semibut.isSelected = false
            monthbut.isSelected = false
        }
        else if(sender.currentTitle == semibut.currentTitle) {
            yearbut.isSelected = false
            semibut.isSelected = true
            monthbut.isSelected = false
        }
        else {
            yearbut.isSelected = false
            semibut.isSelected = false
            monthbut.isSelected = true
        }
        
        pvalue.endEditing(true)
        inter.endEditing(true)
        peri.endEditing(true)
        year.endEditing(true)
        
        
    }
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        let p = Double(pvalue.text ?? "")
        let i = Double(inter.text ?? "")
        let per = Double(peri.text ?? "")
        let y = Double(year.text ?? "")
       
        
        
        
        if(yearbut.isSelected)
        {
            //original
            if(p != nil && i != nil && per != nil && y != nil)
            {
                let l = 1.0 + (i!/100.00)
                let h = pow(l, y!)
                
                t = abs(p! - per!) / h
            }
            else
            {
                t = 0.0
            }
            
        }
        else if(semibut.isSelected)
        {
            
            if(p != nil && i != nil && per != nil && y != nil)
            {
                let m = y!*2
                let l = 1.0 + (i!/100.00)/2
                let h = pow(l, m)
                
                t = abs(p! - per!) / h
            }
            else {
                t = 0.0
            }
            
        }
        else
        {
            if(p != nil && i != nil && per != nil && y != nil)
            {
                let m = y!*12
                let l = 1.0 + (i!/100.00)/12
                let h = pow(l, m)
                
                t = abs(p! - per!) / h
            }
            else {
                t = 0.0
            }
            
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToPv" {
            
            let destinationVC = segue.destination as! PresResultsViewController
            
            destinationVC.total = String(format: "$%.2f" , locale: Locale.current, t)
            destinationVC.summary = "Present value when future value is $\(pvalue.text ?? "") with \(inter.text ?? "")% interest for \(year.text ?? "") years with $\(peri.text ?? "") added every period."
            
            
        }
        
        
    }
    

}
