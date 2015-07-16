//
//  ViewController.swift
//  PickerViewSample
//
//  Created by Prithiviraj on 7/14/15.
//  Copyright (c) 2015 Prithiviraj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var fruitsListBtnObj: UIButton!
    @IBOutlet weak var iPhoneModelListBtnObj: UIButton!
    @IBOutlet weak var pickerViewObj: UIPickerView!
    @IBOutlet weak var subViewObj: UIView!
    
    let fruitsArrayValues = ["Apple","Apricot","Mango","Orange","Banana","Cherry","Grape","Strawberry","Watermelon"]
    let iPhoneModelArrayValues = ["iPhone 3G","iPhone 4","iPhone 4s","iPhone 5","iPhone 5c","iPhone 5s","iPhone 6","iPhone 6Plus"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        subViewObj.hidden = true
    }
    
    //delegate methods.
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        //dynamic delegate methods using pickerviewObj.tag
        if pickerViewObj.tag == 0 {
            return fruitsArrayValues.count
        }
        else {
            return iPhoneModelArrayValues.count
        }
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        if pickerViewObj.tag == 0 {
            return "\(fruitsArrayValues[row])" //its displyed to titleForRow.
        }
        else {
            return "\(iPhoneModelArrayValues[row])"
        }
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //valuesLbl.text = pickerDataValues[row]
    }
    
    @IBAction func selectItemsBtn(sender: AnyObject) {
        //first they set the tag in pickerviewObj.
        subViewObj.hidden = false
        switch sender.tag {
        case 0:
            pickerViewObj.tag = 0
        case 1:
            pickerViewObj.tag = 1
        default:
            break;
        }
        pickerViewObj.reloadAllComponents()
    }
    @IBAction func cancelBtn(sender: AnyObject) {
        subViewObj.hidden = true
    }
    
    @IBAction func doneBtn(sender: AnyObject) {
        if pickerViewObj.tag == 0 {
            let selectedIndex = pickerViewObj.selectedRowInComponent(0)
            fruitsListBtnObj.setTitle(fruitsArrayValues[selectedIndex], forState: UIControlState.Normal)
        }
        else if pickerViewObj.tag == 1 {
            let selectedIndex = pickerViewObj.selectedRowInComponent(0)
            iPhoneModelListBtnObj.setTitle(iPhoneModelArrayValues[selectedIndex], forState: UIControlState.Normal)
        }
        subViewObj.hidden = true
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

