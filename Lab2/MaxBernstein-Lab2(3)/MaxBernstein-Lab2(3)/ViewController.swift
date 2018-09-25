//
//  ViewController.swift
//  MaxBernstein-Lab2(3)
//
//  Created by Max Bernstein on 9/19/18.
//  Copyright © 2018 Max Bernstein. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    private var currentPet:Pet!{
        didSet{
            updateDisplay()
        }
    }
    
    //initialize Pet Objects
    var dog = Pet(petType: .dog)
    var cat = Pet(petType: .cat)
    var bird = Pet(petType: .bird)
    var bunny = Pet(petType: .bunny)
    var fish = Pet(petType: .fish)
    
    
    
    //Feed and Play vars and actions
    @IBOutlet weak var happyVal: UILabel!
    @IBOutlet weak var happyView: DisplayView!
    @IBOutlet weak var feedVal: UILabel!
    @IBOutlet weak var foodView: DisplayView!
    @IBAction func playAction(_ sender: Any) {
        currentPet.playWithPet()
        updateDisplay()
    }
    @IBAction func feedAction(_ sender: Any) {
        currentPet.feedPet()
        updateDisplay()
    }
    
    //Pet Type vars and actions
    @IBOutlet weak var petImage: UIImageView!
    @IBOutlet weak var petBackground: UIView!
    var currentColor: UIColor = UIColor.red
    var currentImage: UIImage = #imageLiteral(resourceName: "dog")
    
    @IBAction func dogButton(_ sender: Any) {
        currentPet = dog
        currentColor = UIColor.red
        currentImage = #imageLiteral(resourceName: "dog")
        dogSound.play()
        updateDisplay()
    }
    @IBAction func catButton(_ sender: Any) {
        currentPet = cat
        currentColor = UIColor.blue
        currentImage = #imageLiteral(resourceName: "cat")
        catSound.play()
        updateDisplay()
    }
    @IBAction func birdButton(_ sender: Any) {
        currentPet = bird
        currentColor = UIColor.yellow
        currentImage = #imageLiteral(resourceName: "bird")
        birdSound.play()
        updateDisplay()
    }
    @IBAction func bunnyButton(_ sender: Any) {
        currentPet = bunny
        currentColor = UIColor.green
        currentImage = #imageLiteral(resourceName: "bunny")
        bunnySound.play()
        updateDisplay()
    }
    @IBAction func fishButton(_ sender: Any) {
        currentPet = fish
        currentColor = UIColor.orange
        currentImage = #imageLiteral(resourceName: "fish")
        fishSound.play()
        updateDisplay()
    }
    
    //Reset Button
    @IBAction func resetButton(_ sender: Any) {
        currentPet.reset()
        updateDisplay()
        
    }
    
    //Sound Effects
    var dogSound : AVAudioPlayer = AVAudioPlayer()
    var catSound: AVAudioPlayer = AVAudioPlayer()
    var birdSound: AVAudioPlayer = AVAudioPlayer()
    var fishSound: AVAudioPlayer = AVAudioPlayer()
    var bunnySound: AVAudioPlayer = AVAudioPlayer()
    
    
    //update display
    func updateDisplay(){
        //update sliding bars
        let happyViewValue = Double(currentPet.happiness)/10
        print("happiness is \(happyViewValue)")
        happyView.animateValue(to: CGFloat(happyViewValue))
        let foodViewValue = Double(currentPet.food)/10
        print("Food is \(foodViewValue)")
        foodView.animateValue(to: CGFloat(foodViewValue))
        
        //update labels
        happyVal.text = "Played:\(String(currentPet.playCounter))"
        feedVal.text = "Fed:\(String(currentPet.feedCounter))"
        
        //update Color and Image
            petImage.image = currentImage
            petBackground.backgroundColor = currentColor
            happyView.color = currentColor
            foodView.color = currentColor
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //set intial pet
        currentPet = dog
        print(currentPet.petType)
        
        //sound initialization
        //DOG Sound
        let dogSoundPath = Bundle.main.path(forResource: "Dogbark", ofType: ".mp3")
        do{
            try dogSound = AVAudioPlayer(contentsOf: URL(fileURLWithPath: dogSoundPath!))
        }
        catch{
            print(error)
        }
        //CAT Sound
        let catSoundPath = Bundle.main.path(forResource: "Catmeow", ofType: ".mp3")
        do{
            try catSound = AVAudioPlayer(contentsOf: URL(fileURLWithPath: catSoundPath!))
        }
        catch{
            print(error)
        }
        //BIRD Sound
        let birdSoundPath = Bundle.main.path(forResource: "Bird2", ofType: ".mp3")
        do{
            try birdSound = AVAudioPlayer(contentsOf: URL(fileURLWithPath: birdSoundPath!))
        }
        catch{
            print(error)
        }
        //Fish Sound
        let fishSoundPath = Bundle.main.path(forResource: "Bubbling-SoundBible.com-1684132696", ofType: ".mp3")
        do{
            try fishSound = AVAudioPlayer(contentsOf: URL(fileURLWithPath: fishSoundPath!))
        }
        catch{
            print(error)
        }
        //Bunny Sound
        let bunnySoundPath = Bundle.main.path(forResource: "Bouncy_Bounce-Bugs_Bunny-1735935456", ofType: ".mp3")
        do{
            try bunnySound = AVAudioPlayer(contentsOf: URL(fileURLWithPath: bunnySoundPath!))
        }
        catch{
            print(error)
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

