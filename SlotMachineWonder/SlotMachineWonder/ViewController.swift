//
//  ViewController.swift
//  SlotMachineWonder
//
//  Created by Mac on 4.07.2022.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return slotArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 100
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let pickerLabel = UILabel()
        pickerLabel.text = slotArray[row]
        pickerLabel.textAlignment = .center
        pickerLabel.font = UIFont.boldSystemFont(ofSize: 60)
        return pickerLabel
    }
    
    
    var slotMachine: UIPickerView!
    var slotArray = ["🍎","🍊","🍌","🍉","🍓","🍒","🍍","🥝"]
    var sonucLabel: UILabel!
    var bakiyeLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
      
       makeSlotMachine()

    }
    
    func makeSlotMachine() {
        
        slotMachine = UIPickerView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 240))
        self.view.addSubview(slotMachine)
        slotMachine.delegate = self
        slotMachine.dataSource = self
        slotMachine.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.6)
        slotMachine.layer.cornerRadius = 12
        slotMachine.center.x = self.view.center.x
        slotMachine.center.y = self.view.center.y - 50
        slotMachine.selectRow(Int(arc4random())%(slotArray.count - 2) + 1, inComponent: 0, animated: true)
        slotMachine.selectRow(Int(arc4random())%(slotArray.count - 2) + 1, inComponent: 1, animated: true)
        slotMachine.selectRow(Int(arc4random())%(slotArray.count - 2) + 1, inComponent: 2, animated: true)
        
        let cevirButton = UIButton(type: .roundedRect)
        cevirButton.backgroundColor = UIColor.systemPurple
        cevirButton.frame = CGRect(x: 0, y: 0, width: 280, height: 50)
        cevirButton.layer.cornerRadius = 12
        self.view.addSubview(cevirButton)
        cevirButton.setTitle("Çevir", for: UIControl.State.normal)
        cevirButton.setTitleColor(.white, for: UIControl.State.normal)
        cevirButton.center.y = self.view.center.y + 140
        cevirButton.center.x = self.view.center.x
        cevirButton.addTarget(self, action: #selector(cevirAction), for: UIControl.Event.touchUpInside)
        
        sonucLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        sonucLabel.textAlignment = .center
        sonucLabel.font = UIFont.boldSystemFont(ofSize: 22)
        sonucLabel.text = ""
        sonucLabel.textColor = UIColor.white
        self.view.addSubview(sonucLabel)
        sonucLabel.center.x = self.view.center.x
        sonucLabel.center.y = cevirButton.center.y + 100
        
        bakiyeLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        bakiyeLabel.textAlignment = .center
        bakiyeLabel.font = UIFont.boldSystemFont(ofSize: 22)
        bakiyeLabel.textColor = UIColor.white
        self.view.addSubview(bakiyeLabel)
        bakiyeLabel.center.x = self.view.center.x
        bakiyeLabel.center.y = sonucLabel.center.y + 80
        
    }

    @objc func cevirAction() {
        
        slotMachine.selectRow(Int(arc4random())%(slotArray.count - 2) + 1, inComponent: 0, animated: true)
        slotMachine.selectRow(Int(arc4random())%(slotArray.count - 2) + 1, inComponent: 1, animated: true)
        slotMachine.selectRow(Int(arc4random())%(slotArray.count - 2) + 1, inComponent: 2, animated: true)
        
        self.sonucGetir()
    }
    
    func sonucGetir() {
        
        if slotMachine.selectedRow(inComponent: 0) == slotMachine.selectedRow(inComponent: 1) && slotMachine.selectedRow(inComponent: 1) == slotMachine.selectedRow(inComponent: 2) {
            
            sonucLabel.text = "👑KAZANDINIZ👑"
          
        } else {
            sonucLabel.text = "🥹KAYBETTİNİZ🥹"
            
        }
    }
    

}

