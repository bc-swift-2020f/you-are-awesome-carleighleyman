//
//  ViewController.swift
//  YouAreAwesome!
//
//  Created by Carleigh Leyman on 9/9/20.
//  Copyright © 2020 Carleigh Leyman. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var imageNumber = -1
    var messageNumber = -1
    var soundNumber = -1
    let totalNumberOfImages = 9
    let totalNumberOfSounds = 6
    var audioPlayer: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
       
        }
    
    func playSound(name: String){
        if let sound = NSDataAsset(name: name) {
            do {
                try audioPlayer = AVAudioPlayer(data: sound.data)
                audioPlayer.play()
            } catch {
                print("🤬 ERROR: \(error.localizedDescription) Could not initialize AVAudioPlayer object.")
            }
        } else {
            print("🤬 ERROR: Could not read data from file sound0")
        }
    }
    func nonRepeatingRandom(originalNumber: Int, upperLimit: Int) -> Int {
        var newNumber: Int
        repeat {
            newNumber = Int.random(in: 0...upperLimit)
        } while originalNumber == newNumber
        return newNumber
    }
    
    

        @IBAction func messageButtonPressed(_ sender: UIButton) {
            let messages = ["You are Awesome!",
                            "You Are Great",
                            "You Are Fantrasic",
                            "Fabulous? That's You!",
                            "When the Genuis Bar Needs Help, They Call You!",
                            "You've Got the Design Skills of Jony Ive"]
            
            messageNumber = nonRepeatingRandom(originalNumber: messageNumber, upperLimit: messages.count-1)
            messageLabel.text = messages[messageNumber]
            
            imageNumber = nonRepeatingRandom(originalNumber: imageNumber, upperLimit: totalNumberOfImages-1)
            imageView.image = UIImage(named: "image\(imageNumber)")
            soundNumber = nonRepeatingRandom(originalNumber: soundNumber, upperLimit: totalNumberOfSounds-1)
            playSound(name: "sound\(soundNumber)")
            
        }
    
    }


