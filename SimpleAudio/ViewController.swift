//
//  ViewController.swift
//  SimpleAudio
//
//  Created by arabian9ts on 2017/08/28.
//  Copyright © 2017年 arabian9ts. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {

    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.player?.delegate = self
        
        let soundFilePath : String = Bundle.main.path(forResource: "Res/shutter", ofType: "mp3")!
        let fileURL : URL = URL(fileURLWithPath: soundFilePath)
        
        do {
            self.player = try AVAudioPlayer(contentsOf: fileURL)
        }
        catch {
            print("cloudn't load audio")
        }
    }

    @IBAction func play(_ sender: UIButton) {
        if (self.player?.isPlaying)! {
            self.player?.pause()
        }
        else {
            self.player?.play()
        }
    }
    
    @IBAction func slide(_ sender: UISlider) {
        self.player?.volume = sender.value
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool){}
    func audioPlayerDecodeErrorDidOccur(_ player: AVAudioPlayer, error: Error?){}

}

