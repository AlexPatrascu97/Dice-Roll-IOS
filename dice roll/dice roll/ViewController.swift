//
//  ViewController.swift
//  dice roll
//
//  Created by alex on 29/04/2019.
//  Copyright © 2019 alex. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var audioPlayer = AVAudioPlayer()
    var audioPlayer2 = AVAudioPlayer()
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var leftImageView: UIImageView!

    @IBOutlet weak var rightImageView: UIImageView!
    
    @IBOutlet weak var leftDownImageView: UIImageView!
    
    @IBOutlet weak var rightDownImageView: UIImageView!
    
    @IBOutlet weak var middleImageView: UIImageView!
    
    @IBOutlet var scoreLabel: UILabel!
    
    @IBOutlet var highscoreLabel: UILabel!
    
    var Score = 0
    var Highscore = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let HighscoreDefault =  UserDefaults.standard
        
        if( HighscoreDefault.value(forKey: "Highscore") != nil)
        {
        Highscore = HighscoreDefault.value(forKey: "Highscore") as! NSInteger
        highscoreLabel.text = NSString(format: "Highscore : %i", Highscore) as String
        }
        
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "sample1" ,ofType: "mp3")!))
            audioPlayer2 = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "sample2" ,ofType: "mp3")!))
            audioPlayer.prepareToPlay()
            audioPlayer2.prepareToPlay()
            audioPlayer.play()
            
            
        }catch{
            print(error)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var backTapped: UIButton!
    
    @IBAction func backBtnTapped(_ sender: Any) {
        audioPlayer.stop()
       
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        
        label.text = " "
        let firstNumber = arc4random_uniform(5) + 1
        let secondNumber = arc4random_uniform(5) + 1
        let thirdNumber = arc4random_uniform(5) + 1
        let fourthNumber = arc4random_uniform(5) + 1
        let fifthNumber = arc4random_uniform(5) + 1
        
        
        if((firstNumber == secondNumber) && (firstNumber == thirdNumber) && (firstNumber == fourthNumber) && (firstNumber == fifthNumber))
        {label.text = "JACKPOT"
            Score = Score + 100
            scoreLabel.text = NSString(format: "Score : %i", Score) as String
            
        }
            
        else if(((firstNumber == secondNumber) && (firstNumber == thirdNumber) && (firstNumber == fourthNumber))||((secondNumber == thirdNumber) && (secondNumber == fourthNumber) && (secondNumber == fifthNumber))||((firstNumber == secondNumber) && (firstNumber == fifthNumber) && (firstNumber == fourthNumber))||((firstNumber == fifthNumber) && (firstNumber == thirdNumber) && (firstNumber == fourthNumber))||((firstNumber == secondNumber) && (firstNumber == thirdNumber) && (firstNumber == fifthNumber)))
        {label.text = "4 of a Kind"
            Score = Score + 16
            scoreLabel.text = NSString(format: "Score : %i", Score) as String
        }
       
            
         else if (((firstNumber == secondNumber) && (firstNumber == thirdNumber))||((firstNumber == secondNumber) && (firstNumber == fourthNumber))||((firstNumber == secondNumber) && (firstNumber == fifthNumber))||((firstNumber == thirdNumber) && (firstNumber == fourthNumber))||((firstNumber == thirdNumber) && (firstNumber == fifthNumber))||((firstNumber == fourthNumber) && (firstNumber == fifthNumber))||((secondNumber == thirdNumber) && (secondNumber == fourthNumber))||((secondNumber == thirdNumber) && (secondNumber == fifthNumber))||((secondNumber == fourthNumber) && (secondNumber == fifthNumber))||((thirdNumber == fourthNumber) && (thirdNumber == fifthNumber))){
            label.text = (label.text ?? "") + "3 of a Kind"
            Score = Score + 8
            scoreLabel.text = NSString(format: "Score : %i", Score) as String
        }
        
       else if((firstNumber == secondNumber)||(firstNumber == thirdNumber)||(firstNumber == fourthNumber)||(firstNumber == fifthNumber)||(secondNumber == thirdNumber)||(secondNumber == fourthNumber)||(secondNumber == fifthNumber)||(thirdNumber == fourthNumber)||(thirdNumber == fourthNumber)||(thirdNumber == fifthNumber)||(fourthNumber == fifthNumber)){
        label.text = (label.text ?? "") + "Two of a kind"
            Score = Score + 4
            scoreLabel.text = NSString(format: "Score : %i", Score) as String
           
        }
        
        if(Score >=  Highscore){
            Highscore = Score
            highscoreLabel.text = NSString(format: "Highscore : %i", Highscore) as String
            
            let HighscoreDefault =  UserDefaults.standard
            HighscoreDefault.setValue(Highscore,forKey: "Highscore")
            HighscoreDefault.synchronize()
        }
        
        leftImageView.image = UIImage(named: "Dice\(firstNumber)")
        rightImageView.image = UIImage(named: "Dice\(secondNumber)")
        leftDownImageView.image = UIImage(named: "Dice\(thirdNumber)")
        rightDownImageView.image = UIImage(named: "Dice\(fourthNumber)")
        middleImageView.image = UIImage(named: "Dice\(fifthNumber)")
        audioPlayer2.stop()
        audioPlayer2.play()
        
        
    }
    
    
   
    @IBOutlet weak var play: UIButton!
    @IBOutlet weak var exit: UIButton!
    @IBAction func exit(_ sender: Any) {
        exit(0)
    }
    @IBAction func play(_ sender: Any) {
        audioPlayer.stop()
        audioPlayer.pause()
        audioPlayer.play()
        
    }
    

}

