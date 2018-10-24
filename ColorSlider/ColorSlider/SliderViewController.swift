//
//  ViewController.swift
//  ColorSlider
//
//  Created by Arpik Sargsyan on 10/16/18.
//  Copyright © 2018 Arpik Sargsyan. All rights reserved.
//

import UIKit

class SliderViewController: UIViewController {
    
    @IBOutlet weak var redColorSlider: UISlider!
    @IBOutlet weak var greenColorSlider: UISlider!
    @IBOutlet weak var blueColorSlider: UISlider!
    @IBOutlet weak var redColorField: UITextField!
    @IBOutlet weak var greenColorField: UITextField!
    @IBOutlet weak var bleueColorField: UITextField!
    @IBOutlet weak var colorSegment: UISegmentedControl!
   
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func switchAction(_ sender: UISwitch) {
        colorSegment.isEnabled = sender.isOn
        redColorSlider.isEnabled = sender.isOn
        greenColorSlider.isEnabled = sender.isOn
        blueColorSlider.isEnabled = sender.isOn
    }
    
    @IBAction func segmentValueChanged(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            view.backgroundColor = UIColor.red
            redColorSlider.value = 255
            greenColorSlider.value = 0
            blueColorSlider.value = 0
            
        } else if sender.selectedSegmentIndex == 1 {
            view.backgroundColor = UIColor.green
            redColorSlider.value = 0
            greenColorSlider.value = 255
            blueColorSlider.value = 0
            
        } else if sender.selectedSegmentIndex == 2 {
            view.backgroundColor = UIColor.blue
            redColorSlider.value = 0
            greenColorSlider.value = 0
            blueColorSlider.value = 255
        }
        
        blueValueChanged()
        redValueChanged()
        greenValueChanged()
        
    }
    
    @IBAction func redSliderAction() {
        redValueChanged()
    }
    
    @IBAction func greenSliderAction() {
        greenValueChanged()
    }
    
    @IBAction func blueSliderAction(){
        blueValueChanged()
    }
    
    func redValueChanged() {
        redColorField.text = String(Int(redColorSlider.value))
        setBackgroundColor()
        setCorrectSegmentValue()
        setSegmentColor()
    }
    
    func greenValueChanged() {
        greenColorField.text = String(Int(greenColorSlider.value))
        setBackgroundColor()
        setCorrectSegmentValue()
        setSegmentColor()
    }
    
    func blueValueChanged() {
        bleueColorField.text = String(Int(blueColorSlider.value))
        setBackgroundColor()
        setCorrectSegmentValue()
        setSegmentColor()
    }
    
    func setCorrectSegmentValue() {
        if redColorField.text == String(255) &&
            greenColorField.text == String(0) &&
            bleueColorField.text == String(0) {
                colorSegment.selectedSegmentIndex = 0
            
        } else if redColorField.text == String(0) &&
            greenColorField.text == String(255) &&
            bleueColorField.text == String(0) {
                colorSegment.selectedSegmentIndex = 1
            
        } else if redColorField.text == String(0) &&
            greenColorField.text == String(0) &&
            bleueColorField.text == String(255) {
                colorSegment.selectedSegmentIndex = 2
        }
    }
    
    func setBackgroundColor() {
        let color = UIColor(red: CGFloat(redColorSlider.value/255.0), green: CGFloat(greenColorSlider.value/255.0), blue: CGFloat(blueColorSlider.value/255.0), alpha: 1.0)
        
        print(color)
        view.backgroundColor = color
    }
    
    func setSegmentColor() {
        if  redColorField.text == String(0) &&
            greenColorField.text == String(0) &&
            bleueColorField.text == String (0) {
                colorSegment.tintColor = UIColor.white
            
        } else if redColorField.text == String(255) &&
                  greenColorField.text == String(255) &&
                  bleueColorField.text == String (255) {
                    colorSegment.tintColor = UIColor.black
        }
    }
}

