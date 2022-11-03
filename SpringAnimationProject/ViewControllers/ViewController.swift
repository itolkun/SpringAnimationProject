//
//  ViewController.swift
//  SpringAnimationProject
//
//  Created by Айтолкун Анарбекова on 2/11/22.
//

import UIKit
import SpringAnimation

class ViewController: UIViewController {

    @IBOutlet var springAnimationView: SpringView!
    
    @IBOutlet var presetLabel: UILabel!
    @IBOutlet var curveLabel: UILabel!
    @IBOutlet var forceLabel: UILabel!
    @IBOutlet var durationLabel: UILabel!
    @IBOutlet var delayLabel: UILabel!
    
    
   var springAnimations: [Animation]! = Animation.getAnimations()

    var currentAnimation = 0
    
    
    override func viewDidLoad() {
        springAnimationView.layer.cornerRadius = 15
    
        showAnimationLabel()
    }
    
    
    @IBAction func startSpringAnimation(_ sender: SpringButton) {
        animateView()
        showAnimationLabel()
        
        currentAnimation += 1
        if currentAnimation >= Animation.getAnimations().count {
            currentAnimation = 0
        }

        sender.setTitle(
            "\(springAnimations[currentAnimation].preset)",
            for:.normal
        )
    }
    
    private func animateView() {
        springAnimationView.animation = springAnimations[currentAnimation].preset
        springAnimationView.curve = springAnimations[currentAnimation].curve
        springAnimationView.force = springAnimations[currentAnimation].force
        springAnimationView.duration = springAnimations[currentAnimation].duration
        springAnimationView.delay = springAnimations[currentAnimation].delay
        
        springAnimationView.animate()
    }
    
    
    private func showAnimationLabel() {
        presetLabel.text = "Preset: \(springAnimations[currentAnimation].preset)"
        curveLabel.text = "Curve: \(springAnimations[currentAnimation].curve)"
        forceLabel.text = "Force: \(springAnimations[currentAnimation].force)"
        durationLabel.text = "Duration: \(springAnimations[currentAnimation].duration)"
        delayLabel.text = "Delay: \(springAnimations[currentAnimation].delay)"
    }
    
}

