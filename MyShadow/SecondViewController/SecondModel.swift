import Foundation
import UIKit

final class SecondModel {

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
     let sunPower: Double = 25
     return sunPower
 }
}
