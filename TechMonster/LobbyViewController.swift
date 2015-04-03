//
//  LobbyViewController.swift
//  TechMonster
//
//  Created by 大氣 on 2015/04/03.
//  Copyright (c) 2015年 Taiki. All rights reserved.
//

import UIkit
import AVFoundation

class LobbyViewController: UIViewController,AVAudioPlayerDelegate {
    
    
    var stamina: Float = 0
    var sutaminaTimer: NSTimer!
    var util : TechDraUtility!
    var player: Player!
    
    @IBOutlet var nameLabel:UILabel!
    @IBOutlet var staminaBar:UIProgressView!
    @IBOutlet var lebelLabel:UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        player = Player()
        
        staminaBar.transform = CGAffineTransformMakeScale(1.0, 4.0)
        
        let userDefaults = NSUserDefaults.standardUserDefaults()
        var level:Int = userDefaults.integerForKey("lebel")
        
        nameLabel.text = player.name
        lebelLabel.text = String(format: "Lv. %d",  level + 1)
        stamina = 100
        
        util = TechDraUtility()
        cureStamina()
        
    }
    
     override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        util.playBGM("lobby")
        
    }
    override func  viewDidDisappear(animated: Bool) {
        util.stopBGM()
    }
    
    //MARK: cure
    
    func cureStamina() {
        sutaminaTimer = NSTimer .scheduledTimerWithTimeInterval(1.0, target: self, selector: "updateStaminaValue", userInfo: nil, repeats: true)
        sutaminaTimer.fire()
    }
    func updateStaminaValue(){
        if stamina <= 100 {
        stamina = stamina + 1
        staminaBar.progress = stamina / 100
        }
        
    }
    
}