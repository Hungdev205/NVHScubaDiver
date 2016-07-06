//
//  ViewController.swift
//  NVHScubaDiver
//
//  Created by Hùng Nguyễn  on 7/5/16.
//  Copyright © 2016 MobileSoftware. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    
    var shark = UIImageView()
    var diver = UIImageView()
    let margin: CGFloat = 30.0
    
    
    var audioPlayer = AVAudioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        drawOcean()
        addObject()
        divingDiver()
        playSound()
    }

    func drawOcean() {
        let background = UIImageView(image: UIImage(named: "lettuce-coral-nicklen.jpg"))
        
        background.frame = self.view.bounds
        background.contentMode = .ScaleToFill
        
        self.view.addSubview(background)
    }
    
    func addObject() {
        diver = UIImageView(frame: CGRectMake(10, 10, 80, 100))
        diver.animationImages = [UIImage(named:"diverScuba-1 (dragged).tiff")!,
                                 UIImage(named:"diverScuba-2 (dragged).tiff")!,
                                 UIImage(named:"diverScuba-3 (dragged).tiff")!,
                                 UIImage(named:"diverScuba-4 (dragged).tiff")!,
                                 UIImage(named:"diverScuba-5 (dragged).tiff")!,
                                 UIImage(named:"diverScuba-6 (dragged).tiff")!,
                                 UIImage(named:"diverScuba-7 (dragged).tiff")!,
                                 UIImage(named:"diverScuba-8 (dragged).tiff")!,
                                 UIImage(named:"diverScuba-9 (dragged).tiff")!,
                                 UIImage(named:"diverScuba-10 (dragged).tiff")!,
                                 UIImage(named:"diverScuba-11 (dragged).tiff")!,
                                 UIImage(named:"diverScuba-12 (dragged).tiff")!,
                                 UIImage(named:"diverScuba-13 (dragged).tiff")!,
                                 UIImage(named:"diverScuba-14 (dragged).tiff")!,
                                 UIImage(named:"diverScuba-15 (dragged).tiff")!
        ]
        diver.animationRepeatCount = 0
        diver.animationDuration = 0.5
        diver.startAnimating()
        self.view.addSubview(diver)
        
//        UIView.animateWithDuration(1, animations: {
//            self.diver.transform = CGAffineTransformConcat(CGAffineTransformScale(self.diver.transform, -0.5, 1), CGAffineTransformMakeRotation(0))
//        })
        
        
        
    }
    
    func divingDiver() {
        UIView.animateWithDuration(7, animations: {
            self.diver.center = CGPointMake(self.view.bounds.size.width - self.margin, self.view.bounds.size.height - self.margin)
        }) {(finished) in
            self.diver.transform = CGAffineTransformConcat(CGAffineTransformScale(self.diver.transform, -4, 1), CGAffineTransformMakeRotation(0))
            
            UIView.animateWithDuration(6, animations: {
                self.diver.center = CGPointMake(self.margin , self.view.bounds.size.height - self.margin)
                
            }) {(finished) in
                self.playSound()
                self.diver.transform = CGAffineTransformConcat(CGAffineTransformScale(self.diver.transform, -1, 1), CGAffineTransformMakeRotation(-120))
                
                UIView.animateWithDuration(7, animations: {
                    self.diver.center = CGPointMake(self.view.bounds.size.width - self.margin , self.margin)
                }) {(finished) in
                    
                    self.diver.transform = CGAffineTransformConcat(CGAffineTransformScale(self.diver.transform, -0.5, 1), CGAffineTransformMakeRotation(120))
                    
                    UIView.animateWithDuration(6, animations: {
                        self.diver.center = CGPointMake(self.margin, self.margin)
                    }) {(finished) in
                        self.diver.transform = CGAffineTransformConcat(CGAffineTransformScale(self.diver.transform, -0.5, 1), CGAffineTransformMakeRotation(0))
                        self.divingDiver()
                        self.playSound()
                    }
                    
                }
            }
        }

    }
    
    func playSound() {
        let filePath = NSBundle.mainBundle().pathForResource("oceanwaves", ofType: ".wav")
        
        let url = NSURL(fileURLWithPath: filePath!)
        
        audioPlayer = try! AVAudioPlayer(contentsOfURL: url)
        audioPlayer.prepareToPlay()
        audioPlayer.play()
        
    }
    
}

