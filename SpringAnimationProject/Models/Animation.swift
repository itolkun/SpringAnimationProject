//
//  SpringAnimationModel.swift
//  SpringAnimationProject
//
//  Created by Айтолкун Анарбекова on 2/11/22.
//

import Foundation

struct Animation {
    let preset: String
    let curve: String
    let force: Double
    let duration: Double
    let delay: Double
    
   
    static func getAnimations() -> [Animation] {
        var animations: [Animation] = []
        
        let presets = DataStore.shared.presets.shuffled()
        let curves = DataStore.shared.curves.shuffled()
        
        let iterationCount = min(
            presets.count,
            curves.count
        )
        for index in 0..<iterationCount {
            let animation = Animation(
                preset: presets[index],
                curve: curves[index],
                force: Double(round(100 * Double.random(in: 1...2)) / 100),
                duration: Double(round(100 * Double.random(in: 0.8...2)) / 100),
                delay: 0.3
            )
            
            animations.append(animation)
            
        }
        return animations
        
    }
}

