import Foundation
import UIKit

final class FirstModel {

    static func getOffsetForShadow (positionSun: UIView, positionView: UIView) -> CGSize {
        let xSun = positionSun.center.x
        let ySun = positionSun.center.y

        let xView = positionView.center.x
        let yView = positionView.center.y

        let distance = sqrt(Double(( xView-xSun )*( xView-xSun )) + (( yView-ySun )*( yView-ySun )))

        let sunPower = getDistance(distance: distance)

        let x = xView - xSun
        let y = yView - ySun

        return CGSize(width: x / sunPower , height: y / sunPower)
     }

    static func getDistance (distance: Double) -> Double {
        var sunPower: Double = 0
        switch distance {
        case 0...50:
            sunPower = 40
        case 51...100:
            sunPower = 35
        case 101...300:
            sunPower = 30
        case 301...500:
            sunPower = 25
        case 501...:
            sunPower = 20
        default:
            break
        }
        return sunPower
    }
}
