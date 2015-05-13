//
//  UIView+Shake.swift
//  SingleLineShakeAnimation
//
//  Created by Håkon Bogen on 24/04/15.
//  Copyright (c) 2015 haaakon. All rights reserved.
//

import UIKit


public enum ShakeDirection : Int {
    case Horizontal
    case Vertical

    private func startPosition() -> ShakePosition {
        switch self {
        case .Horizontal:
            return ShakePosition.Left
        default:
            return ShakePosition.Top
        }
    }
}


extension UIView {

    /**
    Shake a view back and forth for the number of times given in the duration specified.
    If the total duration given is 1 second, and the number of shakes is 5, it will use 0.20 seconds per shake.
    After it's done shaking, the completion handler is called, if specified.

    :param: direction     The direction to shake (horizontal or vertical motion)
    :param: numberOfTimes The total number of times to shake back and forth, default value is 5
    :param: totalDuration Total duration to do the shakes, default is 0.5 seconds
    :param: completion    Optional completion closure
    */
    public func shake(direction: ShakeDirection, numberOfTimes: Int = 5, totalDuration : Float = 0.5, completion: (() -> Void)? = nil) {
        let timePerShake = Double(totalDuration) / Double(numberOfTimes)
        shake(forTimes: numberOfTimes, position: direction.startPosition(), durationPerShake: timePerShake, completion: completion)
    }

    private func shake(#forTimes: Int, position: ShakePosition, durationPerShake: NSTimeInterval, completion: (() -> Void)?) {
        UIView.animateWithDuration(durationPerShake, animations: { () -> Void in

            switch position.direction {
            case .Horizontal:
                self.layer.setAffineTransform( CGAffineTransformMakeTranslation(2 * position.value, 0))
                break
            case .Vertical:
                self.layer.setAffineTransform( CGAffineTransformMakeTranslation(0, 2 * position.value))
                break
            }
            }) { (complete) -> Void in
                if (forTimes == 0) {
                    UIView.animateWithDuration(durationPerShake, animations: { () -> Void in
                        self.layer.setAffineTransform(CGAffineTransformIdentity)
                        }, completion: { (complete) -> Void in
                            completion?()
                    })
                } else {
                    self.shake(forTimes: forTimes - 1, position: position.oppositePosition(), durationPerShake: durationPerShake, completion:completion)
                }
        }
    }

}

private struct ShakePosition  {

    let value : CGFloat
    let direction : ShakeDirection

    init(value: CGFloat, direction : ShakeDirection) {
        self.value = value
        self.direction = direction
    }


    func oppositePosition() -> ShakePosition {
        return ShakePosition(value: (self.value * -1), direction: direction)
    }

    static var Left : ShakePosition {
        get {
            return ShakePosition(value: 1, direction: .Horizontal)
        }
    }

    static var Right : ShakePosition {
        get {
            return ShakePosition(value: -1, direction: .Horizontal)
        }
    }

    static var Top : ShakePosition {
        get {
            return ShakePosition(value: 1, direction: .Vertical)
        }
    }

    static var Bottom : ShakePosition {
        get {
            return ShakePosition(value: -1, direction: .Vertical)
        }
    }
}

