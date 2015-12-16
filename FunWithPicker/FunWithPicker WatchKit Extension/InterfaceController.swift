//
//  InterfaceController.swift
//  PickerImagesApp WatchKit Extension
//
//  Created by Kyle Huber on 11/11/15.
//  Copyright © 2015 Kyle Huber. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet var myGroup: WKInterfaceGroup!
    @IBOutlet var myPicker: WKInterfacePicker!
    @IBOutlet var itemLabel: WKInterfaceLabel!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        var pickerItems = [WKPickerItem]()
        
        for index in 0...10 {
            let pickerItem = WKPickerItem()
            pickerItem.contentImage = WKImage(imageName: "percent\(index)")
            pickerItems.append(pickerItem)
        }
        
        myPicker.setItems(pickerItems)

        var imageArray = [UIImage]()
        
        for index in 0...10 {
            let image = UIImage(named: "progressarc\(index)")
            print(image!)
            imageArray.append(image!)
        }
        
        let progressImages = UIImage.animatedImageWithImages(imageArray,
            duration: 0.0)
        myGroup.setBackgroundImage(progressImages)
        myPicker.setCoordinatedAnimations([myGroup])

        // Configure interface objects here.
    }
    
    @IBAction func pickerChanged(value: Int) {
        let value: Int = value * 10
        let formatter = NSNumberFormatter()
        formatter.numberStyle = NSNumberFormatterStyle.SpellOutStyle
        itemLabel?.setText(formatter.stringFromNumber(value))
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
