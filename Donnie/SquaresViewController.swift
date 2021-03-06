//
//  SquaresViewController.swift
//  Donnie
//
//  Created by Donnie Wang on 7/13/15.
//  Copyright (c) 2015 Donnie Wang. All rights reserved.
//

import UIKit

class SquaresViewController: UIViewController {
    @IBOutlet weak var helloWorldLabel: UILabel!
    @IBOutlet weak var redButton: UIButton!
    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var yellowButton: UIButton!
    
    var sequence: [UIButton] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func redButtonTouched(sender: UIButton) {
        self.helloWorldLabel.text = "You touched red"
        println("The user touched the red square: \(sender)")
    }
    
    @IBAction func greenButtonTouched(sender: UIButton) {
        self.helloWorldLabel.text = "You touched green"
        println("The user touched the green square: \(sender)")
    }
    
    @IBAction func blueButtonTouched(sender: UIButton) {
        self.helloWorldLabel.text = "You touched blue"
        println("The user touched the blue square: \(sender)")
    }
    
    @IBAction func yellowButtonTouched(sender: UIButton) {
        self.helloWorldLabel.text = "You touched yellow"
        println("The user touched the yellow square: \(sender)")
    }
    
    @IBAction func startButtonTouched(sender: UIButton) {
        // add new square to sequence
        addNewSquare()
        
        // blink the squares
        blinkSequenceSquareAtIndex(0)

        self.helloWorldLabel.text = "Started the game"
        println("The user touched the start button")
        println(sequence)
        
        // listen for user taps
        
    }
    
    func blinkSequenceSquareAtIndex(index: Int) {
        if (index >= sequence.count) {
            return
        } else {
            UIView.animateWithDuration(0.8, animations: { () -> Void in
                self.sequence[index].alpha = 0.0;
                },
                completion: { (Bool) -> Void in
                    UIView.animateWithDuration(0.8, animations: { () -> Void in
                        self.sequence[index].alpha = 1;
                    });
                    self.blinkSequenceSquareAtIndex(index + 1)
                }
            );
        }
    }
    
    func addNewSquare() {
        var squares = [redButton, greenButton, blueButton, yellowButton]
        var randomNumber = Int(arc4random_uniform(4))
        sequence.append(squares[randomNumber])
    }
}


// Old code from programmatic UI
//    override func loadView() {
//        self.view = UIView(frame: UIScreen.mainScreen().bounds)
//
//        self.view?.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
//
//        var redRect = UIButton(frame: CGRect(x: 8, y: 32, width: 175.5, height: 175.5))
//        redRect.backgroundColor = UIColor.redColor()
//        redRect.addTarget(self, action: "redButtonTouched:", forControlEvents: UIControlEvents.TouchUpInside)
//
//        var greenRect = UIButton(frame: CGRect(x: 191.5, y: 32, width: 175.5, height: 175.5))
//        greenRect.backgroundColor = UIColor.greenColor()
//        greenRect.addTarget(self, action: "greenButtonTouched:", forControlEvents: UIControlEvents.TouchUpInside)
//
//        var blueRect = UIButton(frame: CGRect(x: 8, y: 215.5, width: 175.5, height: 175.5))
//        blueRect.backgroundColor = UIColor.blueColor()
//        blueRect.addTarget(self, action: "blueButtonTouched:", forControlEvents: UIControlEvents.TouchUpInside)
//
//        var yellowRect = UIButton(frame: CGRect(x: 191.5, y: 215.5, width: 175.5, height: 175.5))
//        yellowRect.backgroundColor = UIColor.yellowColor()
//        yellowRect.addTarget(self, action: "yellowButtonTouched:", forControlEvents: UIControlEvents.TouchUpInside)
//
//        self.view?.addSubview(redRect)
//        self.view?.addSubview(greenRect)
//        self.view?.addSubview(blueRect)
//        self.view?.addSubview(yellowRect)
//
//        var redLabel = UILabel(frame: CGRect(x: 8, y: 8, width: 0, height: 0))
//        redLabel.text = "Red Square"
//        redLabel.backgroundColor = UIColor.lightGrayColor()
//        redLabel.sizeToFit()
//        redLabel.textAlignment = NSTextAlignment.Left
//
//        var greenLabel = UILabel(frame: CGRect(x: 8, y: 8, width: 0, height: 0))
//        greenLabel.text = "Green Square"
//        greenLabel.backgroundColor = UIColor.lightGrayColor()
//        greenLabel.sizeToFit()
//        greenLabel.textAlignment = NSTextAlignment.Left
//
//        var blueLabel = UILabel(frame: CGRect(x: 8, y: 8, width: 0, height: 0))
//        blueLabel.text = "Blue Square"
//        blueLabel.backgroundColor = UIColor.lightGrayColor()
//        blueLabel.sizeToFit()
//        blueLabel.textAlignment = NSTextAlignment.Left
//
//        var yellowLabel = UILabel(frame: CGRect(x: 8, y: 8, width: 0, height: 0))
//        yellowLabel.text = "Yellow Square"
//        yellowLabel.backgroundColor = UIColor.lightGrayColor()
//        yellowLabel.sizeToFit()
//        yellowLabel.textAlignment = NSTextAlignment.Left
//
//        var label = UILabel(frame: CGRect(x: 8, y: 397, width: 359, height: 20))
//        label.text = "Hello World"
//        label.backgroundColor = UIColor.lightGrayColor()
//        label.textAlignment = NSTextAlignment.Center
//
//        redRect.addSubview(redLabel)
//        greenRect.addSubview(greenLabel)
//        blueRect.addSubview(blueLabel)
//        yellowRect.addSubview(yellowLabel)
//        self.view?.addSubview(label)
//
//        var redImage = UIImageView(frame: CGRect(x: 62.75, y: 62.75, width: 50, height: 50))
//        redImage.image = UIImage(named: "Star.png")
//        redRect.addSubview(redImage)
//
//        var greenImage = UIImageView(frame: CGRect(x: 62.75, y: 62.75, width: 50, height: 50))
//        greenImage.image = UIImage(named: "Star.png")
//        greenRect.addSubview(greenImage)
//
//        var blueImage = UIImageView(frame: CGRect(x: 62.75, y: 62.75, width: 50, height: 50))
//        blueImage.image = UIImage(named: "Star.png")
//        blueRect.addSubview(blueImage)
//
//        var yellowImage = UIImageView(frame: CGRect(x: 62.75, y: 62.75, width: 50, height: 50))
//        yellowImage.image = UIImage(named: "Star.png")
//        yellowRect.addSubview(yellowImage)
//
//        var myButton = UIButton(frame: CGRect(x: 8, y: 433, width: 359, height: 20))
//        myButton.setTitle("Start", forState: UIControlState.Normal)
//        myButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
//        self.view?.addSubview(myButton)
//        myButton.addTarget(self, action: "buttonTouched:", forControlEvents: UIControlEvents.TouchUpInside)
//    }

