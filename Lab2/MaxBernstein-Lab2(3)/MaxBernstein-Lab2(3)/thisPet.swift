//
//  thisPet.swift
//  MaxBernstein-Lab2(3)
//
//  Created by Max Bernstein on 9/24/18.
//  Copyright © 2018 Max Bernstein. All rights reserved.
//

import Foundation

class Pet{
    
    //Data
    public var food:Int
    public var happiness:Int
    var feedCounter:Int
    var playCounter:Int
    var petType:petSpecies
   
    
    //Which Pet?
    enum petSpecies{
        case dog, cat, bird, bunny, fish
        
    }
    
    
    //Behavior
    func feedPet(){
        food += 1
        if(food > 10){
            food = 10
        }
        feedCounter += 1
    }
    
    func playWithPet(){
        happiness += 1
        food -= 1
        if(happiness > 10){
            happiness = 10
        }
        if(food < 0){
            food = 0
        }
        playCounter += 1
    }
    
    //reset function
    func reset(){
        food = 5
        happiness = 5
        playCounter = 0
        feedCounter = 0
    }
    

    //Initialize
    init(petType : petSpecies){
        self.petType = petType
        self.food = 5
        self.happiness = 5
        self.feedCounter = 0
        self.playCounter = 0
    }
    
}
