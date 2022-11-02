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
    
    @IBOutlet var springAnimationButton: SpringButton!
    
    @IBOutlet var springPresetLabel: SpringLabel!
    @IBOutlet var springCurveLabel: SpringLabel!
    @IBOutlet var springForceLabel: SpringLabel!
    @IBOutlet var springDurationLabel: SpringLabel!
    @IBOutlet var springDelayLabel: SpringLabel!
    
    
   var springAnimations: [Animation]! = Animation.getAnimations()

    var currentAnimation = 0
    
    
    override func viewDidLoad() {
        springAnimationView.layer.cornerRadius = 15
        springAnimationButton.layer.cornerRadius = 15
    
        showAnimationLabel()
    }
    
    
    @IBAction func startSpringAnimation(_ sender: SpringButton) {
        animateView()
        showAnimationLabel()
        
        currentAnimation += 1
        if currentAnimation >= Animation.getAnimations().count {
            currentAnimation = 0
        }

        showNextAnimation()
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
        springPresetLabel.text = "Preset: \(springAnimations[currentAnimation].preset)"
        springCurveLabel.text = "Curve: \(springAnimations[currentAnimation].curve)"
        springForceLabel.text = "Force: \(springAnimations[currentAnimation].force)"
        springDurationLabel.text = "Duration: \(springAnimations[currentAnimation].duration)"
        springDelayLabel.text = "Delay: \(springAnimations[currentAnimation].delay)"
    }
    
    private func showNextAnimation() {
        springAnimationButton.setTitle(
            "\(springAnimations[currentAnimation].preset)",
            for:.normal
        )
    }
}

