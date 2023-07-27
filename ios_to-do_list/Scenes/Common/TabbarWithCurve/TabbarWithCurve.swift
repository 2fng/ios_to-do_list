//
//  TabbarWithCurve.swift
//  ios_to-do_list
//
//  Created by Hua Son Tung on 24/07/2023.
//

import Foundation
import UIKit
import Then

extension UITabBar {

    func addShape() {
        let shapeLayer = CAShapeLayer()
        shapeLayer.do {
            $0.path = createPath()
            $0.fillColor = UIColor.primaryDark.cgColor
            $0.lineWidth = 1.0
        }
        if self.layer.sublayers?.count ?? 0 >= 6 {
            self.layer.sublayers?.removeFirst(3)
        }

        self.layer.insertSublayer(shapeLayer, at: 0)
    }

    func removeDraw() {
        let shapeLayer = CAShapeLayer().with {
            $0.path = clearPath()
            $0.fillColor = UIColor.clear.cgColor
            $0.lineWidth = 1.0
        }

        if self.layer.sublayers?.count ?? 0 >= 6 {
            self.layer.sublayers?.removeFirst()
        }
        self.layer.insertSublayer(shapeLayer, at: 0)
    }

    private func createPath() -> CGPath {

        let height: CGFloat = 30
        let path = UIBezierPath()
        let centerWidth = self.frame.width / 2

        path.move(to: CGPoint(x: 0, y: height + 10)) // start top left
        path.addArc(withCenter: CGPoint(x: height, y: height + 10),
                    radius: 40,
                    startAngle: CGFloat(Double.pi),
                    endAngle: CGFloat(Double.pi/2 * 3),
                    clockwise: true)
        path.addLine(to: CGPoint(x: (centerWidth - height * 2), y: 0)) // the beginning of the trough
        // First curve down
        path.addCurve(to: CGPoint(x: centerWidth, y: height),
                      controlPoint1: CGPoint(x: (centerWidth - 20), y: 0),
                      controlPoint2: CGPoint(x: centerWidth - 32, y: height))
        // Second curve up
        path.addCurve(to: CGPoint(x: (centerWidth + height * 2), y: 0),
                      controlPoint1: CGPoint(x: centerWidth + 32, y: height),
                      controlPoint2: CGPoint(x: (centerWidth + 20), y: 0))

        // Complete the rect
        path.addLine(to: CGPoint(x: self.frame.width - height, y: 0))
        path.addArc(withCenter: CGPoint(x: self.frame.width - height, y: height + 10),
                    radius: 40,
                    startAngle: CGFloat(Double.pi/2 * 3),
                    endAngle: 0,
                    clockwise: true)
        path.addLine(to: CGPoint(x: self.frame.width, y: height))
        path.addLine(to: CGPoint(x: self.frame.width, y: self.frame.height))
        path.addLine(to: CGPoint(x: 0, y: self.frame.height))
        path.close()

        return path.cgPath
    }

    private func clearPath() -> CGPath {
        let height: CGFloat = 30
        let path = UIBezierPath()
        let centerWidth = self.frame.width / 2

        path.move(to: CGPoint(x: 0, y: 0)) // start top left
        path.addLine(to: CGPoint(x: (centerWidth - height * 2), y: 0)) // the beginning of the trough

        // Complete the rect
        path.addLine(to: CGPoint(x: self.frame.width, y: 0))
        path.addLine(to: CGPoint(x: self.frame.width, y: self.frame.height))
        path.addLine(to: CGPoint(x: 0, y: self.frame.height))
        path.close()

        return path.cgPath
    }
}

extension CGFloat {
    var degreesToRadians: CGFloat { return self * .pi / 180 }
    var radiansToDegrees: CGFloat { return self * 180 / .pi }
}
