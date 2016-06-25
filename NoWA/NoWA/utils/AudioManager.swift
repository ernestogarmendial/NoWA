//
//  AudioManager.swift


import UIKit
import AVFoundation


@objc(AudioManager) public class AudioManager: NSObject {

    static let sharedInstance: AudioManager = AudioManager()
    
    
    var players: NSMutableDictionary;
    
    var temp: NSMutableArray;
    
    override init() {
        players = NSMutableDictionary()
        temp = NSMutableArray()
    }
    
    func play(file: String) {
        if let player = players[file] as? AVAudioPlayer {
            self.stopPlayer(player)
            player.numberOfLoops = 3
            self.playPlayer(player)
            return
        }
        
        do {
            let audioPlayer = try AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: file))
            self.playPlayer(audioPlayer)
            players[file] = audioPlayer
        } catch {
            //Handle the error
        }

    }
    
    func stop(file: String) {
        if let player = players[file] as? AVAudioPlayer {
            self.stopPlayer(player)
        }
    }
    
    func stopAllSounds(){
        for sonidos in players.allValues as! [AVAudioPlayer] {
            self.stopPlayer(sonidos)
        }
    }
    
    func isPlaying(file: String) -> Bool {
        if let player = players[file] as? AVAudioPlayer {
            return player.playing
        }
        return false;
    }
    
    internal func playPlayer(player: AVAudioPlayer!){
        player.prepareToPlay()
        player.numberOfLoops = 3
        player.play()
    }
    
    internal func stopPlayer(player: AVAudioPlayer!){
        player.stop()
        player.currentTime = 0
    }
    
    func prepareManager (file: String) {
        if let player = players[file] as? AVAudioPlayer {
            player.prepareToPlay()
            return
        }
     
        do {
            var audioPlayer =  try AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: file))
            
            audioPlayer.prepareToPlay()
            
            temp.addObject(audioPlayer)
        } catch {
            //Handle the error
        }

    }
    

    
}
