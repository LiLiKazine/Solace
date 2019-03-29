//
//  IconsDrawing.swift
//  Solace
//
//  Created by LiLi Kazine on 2019/3/29.
//  Copyright © 2019 LiLi Kazine. All rights reserved.
//

import UIKit

// size 48 * 36

func drawAdjust() -> UIBezierPath {
    
   
    //// adjust.svg Group
    //// Bezier Drawing
    let bezierPath = UIBezierPath()
    bezierPath.move(to: CGPoint(x: 28.84, y: 34.86))
    bezierPath.addCurve(to: CGPoint(x: 33.36, y: 31.91), controlPoint1: CGPoint(x: 31.1, y: 34.86), controlPoint2: CGPoint(x: 32.71, y: 33.68))
    bezierPath.addLine(to: CGPoint(x: 57.89, y: 31.91))
    bezierPath.addCurve(to: CGPoint(x: 59.5, y: 30.43), controlPoint1: CGPoint(x: 58.85, y: 31.91), controlPoint2: CGPoint(x: 59.5, y: 31.32))
    bezierPath.addCurve(to: CGPoint(x: 57.89, y: 28.95), controlPoint1: CGPoint(x: 59.5, y: 29.55), controlPoint2: CGPoint(x: 58.85, y: 28.95))
    bezierPath.addLine(to: CGPoint(x: 33.36, y: 28.95))
    bezierPath.addCurve(to: CGPoint(x: 28.84, y: 26), controlPoint1: CGPoint(x: 32.71, y: 27.18), controlPoint2: CGPoint(x: 30.78, y: 26))
    bezierPath.addCurve(to: CGPoint(x: 24, y: 30.43), controlPoint1: CGPoint(x: 26.26, y: 26), controlPoint2: CGPoint(x: 24, y: 28.07))
    bezierPath.addCurve(to: CGPoint(x: 28.84, y: 34.86), controlPoint1: CGPoint(x: 24, y: 32.8), controlPoint2: CGPoint(x: 26.26, y: 34.86))
    bezierPath.close()
    bezierPath.move(to: CGPoint(x: 28.84, y: 28.95))
    bezierPath.addCurve(to: CGPoint(x: 30.45, y: 30.43), controlPoint1: CGPoint(x: 29.81, y: 28.95), controlPoint2: CGPoint(x: 30.45, y: 29.55))
    bezierPath.addCurve(to: CGPoint(x: 28.84, y: 31.91), controlPoint1: CGPoint(x: 30.45, y: 31.32), controlPoint2: CGPoint(x: 29.81, y: 31.91))
    bezierPath.addCurve(to: CGPoint(x: 27.23, y: 30.43), controlPoint1: CGPoint(x: 27.87, y: 31.91), controlPoint2: CGPoint(x: 27.23, y: 31.32))
    bezierPath.addCurve(to: CGPoint(x: 28.84, y: 28.95), controlPoint1: CGPoint(x: 27.23, y: 29.55), controlPoint2: CGPoint(x: 27.87, y: 28.95))
    bezierPath.close()
    
    //// Bezier 2 Drawing
    let bezier2Path = UIBezierPath()
    bezier2Path.move(to: CGPoint(x: 57.89, y: 40.77))
    bezier2Path.addLine(to: CGPoint(x: 46.27, y: 40.77))
    bezier2Path.addCurve(to: CGPoint(x: 41.75, y: 37.82), controlPoint1: CGPoint(x: 45.62, y: 39), controlPoint2: CGPoint(x: 43.69, y: 37.82))
    bezier2Path.addCurve(to: CGPoint(x: 37.23, y: 40.77), controlPoint1: CGPoint(x: 39.81, y: 37.82), controlPoint2: CGPoint(x: 37.88, y: 39))
    bezier2Path.addLine(to: CGPoint(x: 25.61, y: 40.77))
    bezier2Path.addCurve(to: CGPoint(x: 24, y: 42.25), controlPoint1: CGPoint(x: 24.65, y: 40.77), controlPoint2: CGPoint(x: 24, y: 41.36))
    bezier2Path.addCurve(to: CGPoint(x: 25.61, y: 43.73), controlPoint1: CGPoint(x: 24, y: 43.14), controlPoint2: CGPoint(x: 24.65, y: 43.73))
    bezier2Path.addLine(to: CGPoint(x: 37.23, y: 43.73))
    bezier2Path.addCurve(to: CGPoint(x: 41.75, y: 46.68), controlPoint1: CGPoint(x: 37.88, y: 45.5), controlPoint2: CGPoint(x: 39.81, y: 46.68))
    bezier2Path.addCurve(to: CGPoint(x: 46.27, y: 43.73), controlPoint1: CGPoint(x: 43.69, y: 46.68), controlPoint2: CGPoint(x: 45.62, y: 45.5))
    bezier2Path.addLine(to: CGPoint(x: 57.89, y: 43.73))
    bezier2Path.addCurve(to: CGPoint(x: 59.5, y: 42.25), controlPoint1: CGPoint(x: 58.85, y: 43.73), controlPoint2: CGPoint(x: 59.5, y: 43.14))
    bezier2Path.addCurve(to: CGPoint(x: 57.89, y: 40.77), controlPoint1: CGPoint(x: 59.5, y: 41.36), controlPoint2: CGPoint(x: 58.85, y: 40.77))
    bezier2Path.close()
    bezier2Path.move(to: CGPoint(x: 41.75, y: 43.73))
    bezier2Path.addCurve(to: CGPoint(x: 40.14, y: 42.25), controlPoint1: CGPoint(x: 40.78, y: 43.73), controlPoint2: CGPoint(x: 40.14, y: 43.14))
    bezier2Path.addCurve(to: CGPoint(x: 41.75, y: 40.77), controlPoint1: CGPoint(x: 40.14, y: 41.36), controlPoint2: CGPoint(x: 40.78, y: 40.77))
    bezier2Path.addCurve(to: CGPoint(x: 43.36, y: 42.25), controlPoint1: CGPoint(x: 42.72, y: 40.77), controlPoint2: CGPoint(x: 43.36, y: 41.36))
    bezier2Path.addCurve(to: CGPoint(x: 41.75, y: 43.73), controlPoint1: CGPoint(x: 43.36, y: 43.14), controlPoint2: CGPoint(x: 42.72, y: 43.73))
    bezier2Path.close()
    
    //// Bezier 3 Drawing
    let bezier3Path = UIBezierPath()
    bezier3Path.move(to: CGPoint(x: 54.66, y: 49.64))
    bezier3Path.addCurve(to: CGPoint(x: 50.14, y: 52.59), controlPoint1: CGPoint(x: 52.4, y: 49.64), controlPoint2: CGPoint(x: 50.79, y: 50.82))
    bezier3Path.addLine(to: CGPoint(x: 25.61, y: 52.59))
    bezier3Path.addCurve(to: CGPoint(x: 24, y: 54.07), controlPoint1: CGPoint(x: 24.65, y: 52.59), controlPoint2: CGPoint(x: 24, y: 53.18))
    bezier3Path.addCurve(to: CGPoint(x: 25.61, y: 55.55), controlPoint1: CGPoint(x: 24, y: 54.95), controlPoint2: CGPoint(x: 24.65, y: 55.55))
    bezier3Path.addLine(to: CGPoint(x: 50.14, y: 55.55))
    bezier3Path.addCurve(to: CGPoint(x: 54.66, y: 58.5), controlPoint1: CGPoint(x: 50.79, y: 57.32), controlPoint2: CGPoint(x: 52.72, y: 58.5))
    bezier3Path.addCurve(to: CGPoint(x: 59.5, y: 54.07), controlPoint1: CGPoint(x: 57.24, y: 58.5), controlPoint2: CGPoint(x: 59.5, y: 56.43))
    bezier3Path.addCurve(to: CGPoint(x: 54.66, y: 49.64), controlPoint1: CGPoint(x: 59.5, y: 51.7), controlPoint2: CGPoint(x: 57.24, y: 49.64))
    bezier3Path.close()
    bezier3Path.move(to: CGPoint(x: 54.66, y: 55.55))
    bezier3Path.addCurve(to: CGPoint(x: 53.05, y: 54.07), controlPoint1: CGPoint(x: 53.69, y: 55.55), controlPoint2: CGPoint(x: 53.05, y: 54.95))
    bezier3Path.addCurve(to: CGPoint(x: 54.66, y: 52.59), controlPoint1: CGPoint(x: 53.05, y: 53.18), controlPoint2: CGPoint(x: 53.69, y: 52.59))
    bezier3Path.addCurve(to: CGPoint(x: 56.27, y: 54.07), controlPoint1: CGPoint(x: 55.63, y: 52.59), controlPoint2: CGPoint(x: 56.27, y: 53.18))
    bezier3Path.addCurve(to: CGPoint(x: 54.66, y: 55.55), controlPoint1: CGPoint(x: 56.27, y: 54.95), controlPoint2: CGPoint(x: 55.63, y: 55.55))
    bezier3Path.close()
    
    bezierPath.append(bezier2Path)
    bezierPath.append(bezier3Path)
    return bezierPath
}

func drawCamera() -> UIBezierPath {
   
    //// camera_fill.svg Group
    //// Bezier Drawing
    let bezierPath = UIBezierPath()
    bezierPath.move(to: CGPoint(x: 36.91, y: 42.96))
    bezierPath.addLine(to: CGPoint(x: 36.91, y: 42.96))
    bezierPath.addCurve(to: CGPoint(x: 41.75, y: 47.94), controlPoint1: CGPoint(x: 36.91, y: 45.71), controlPoint2: CGPoint(x: 39.08, y: 47.94))
    bezierPath.addCurve(to: CGPoint(x: 46.59, y: 42.96), controlPoint1: CGPoint(x: 44.42, y: 47.94), controlPoint2: CGPoint(x: 46.59, y: 45.71))
    bezierPath.addLine(to: CGPoint(x: 46.59, y: 42.96))
    bezierPath.addCurve(to: CGPoint(x: 41.75, y: 37.97), controlPoint1: CGPoint(x: 46.59, y: 40.2), controlPoint2: CGPoint(x: 44.42, y: 37.97))
    bezierPath.addCurve(to: CGPoint(x: 36.91, y: 42.96), controlPoint1: CGPoint(x: 39.08, y: 37.97), controlPoint2: CGPoint(x: 36.91, y: 40.2))
    bezierPath.close()
    
    //// Bezier 2 Drawing
    let bezier2Path = UIBezierPath()
    bezier2Path.move(to: CGPoint(x: 54.98, y: 29.66))
    bezier2Path.addLine(to: CGPoint(x: 35.3, y: 29.66))
    bezier2Path.addCurve(to: CGPoint(x: 33.68, y: 28), controlPoint1: CGPoint(x: 35.3, y: 28.66), controlPoint2: CGPoint(x: 34.65, y: 28))
    bezier2Path.addLine(to: CGPoint(x: 30.45, y: 28))
    bezier2Path.addCurve(to: CGPoint(x: 28.84, y: 29.66), controlPoint1: CGPoint(x: 29.49, y: 28), controlPoint2: CGPoint(x: 28.84, y: 28.66))
    bezier2Path.addLine(to: CGPoint(x: 28.52, y: 29.66))
    bezier2Path.addCurve(to: CGPoint(x: 24, y: 34.31), controlPoint1: CGPoint(x: 25.94, y: 29.66), controlPoint2: CGPoint(x: 24, y: 31.66))
    bezier2Path.addLine(to: CGPoint(x: 24, y: 51.6))
    bezier2Path.addCurve(to: CGPoint(x: 28.52, y: 56.25), controlPoint1: CGPoint(x: 24, y: 54.26), controlPoint2: CGPoint(x: 25.94, y: 56.25))
    bezier2Path.addLine(to: CGPoint(x: 54.98, y: 56.25))
    bezier2Path.addCurve(to: CGPoint(x: 59.5, y: 51.6), controlPoint1: CGPoint(x: 57.56, y: 56.25), controlPoint2: CGPoint(x: 59.5, y: 54.26))
    bezier2Path.addLine(to: CGPoint(x: 59.5, y: 34.31))
    bezier2Path.addCurve(to: CGPoint(x: 54.98, y: 29.66), controlPoint1: CGPoint(x: 59.5, y: 31.66), controlPoint2: CGPoint(x: 57.56, y: 29.66))
    bezier2Path.close()
    bezier2Path.move(to: CGPoint(x: 41.75, y: 51.26))
    bezier2Path.addCurve(to: CGPoint(x: 33.68, y: 42.96), controlPoint1: CGPoint(x: 37.23, y: 51.26), controlPoint2: CGPoint(x: 33.68, y: 47.61))
    bezier2Path.addCurve(to: CGPoint(x: 41.75, y: 34.65), controlPoint1: CGPoint(x: 33.68, y: 38.3), controlPoint2: CGPoint(x: 37.23, y: 34.65))
    bezier2Path.addCurve(to: CGPoint(x: 49.82, y: 42.96), controlPoint1: CGPoint(x: 46.27, y: 34.65), controlPoint2: CGPoint(x: 49.82, y: 38.3))
    bezier2Path.addCurve(to: CGPoint(x: 41.75, y: 51.26), controlPoint1: CGPoint(x: 49.82, y: 47.61), controlPoint2: CGPoint(x: 46.27, y: 51.26))
    bezier2Path.close()
    bezier2Path.move(to: CGPoint(x: 53.05, y: 37.97))
    bezier2Path.addCurve(to: CGPoint(x: 51.43, y: 36.31), controlPoint1: CGPoint(x: 52.08, y: 37.97), controlPoint2: CGPoint(x: 51.43, y: 37.31))
    bezier2Path.addCurve(to: CGPoint(x: 53.05, y: 34.65), controlPoint1: CGPoint(x: 51.43, y: 35.31), controlPoint2: CGPoint(x: 52.08, y: 34.65))
    bezier2Path.addCurve(to: CGPoint(x: 54.66, y: 36.31), controlPoint1: CGPoint(x: 54.01, y: 34.65), controlPoint2: CGPoint(x: 54.66, y: 35.31))
    bezier2Path.addCurve(to: CGPoint(x: 53.05, y: 37.97), controlPoint1: CGPoint(x: 54.66, y: 37.31), controlPoint2: CGPoint(x: 54.01, y: 37.97))
    bezier2Path.close()
    
    bezierPath.append(bezier2Path)
    return bezierPath
}

func drawSpeaker() -> UIBezierPath {
    
    //// 语音.svg Group
    //// Bezier Drawing
    let bezierPath = UIBezierPath()
    bezierPath.move(to: CGPoint(x: 42.16, y: 47.2))
    bezierPath.addLine(to: CGPoint(x: 42.16, y: 47.2))
    bezierPath.addCurve(to: CGPoint(x: 48.99, y: 39.95), controlPoint1: CGPoint(x: 45.92, y: 47.2), controlPoint2: CGPoint(x: 48.99, y: 43.94))
    bezierPath.addLine(to: CGPoint(x: 48.99, y: 31.25))
    bezierPath.addCurve(to: CGPoint(x: 42.16, y: 24), controlPoint1: CGPoint(x: 48.99, y: 27.26), controlPoint2: CGPoint(x: 45.92, y: 24))
    bezierPath.addLine(to: CGPoint(x: 42.16, y: 24))
    bezierPath.addCurve(to: CGPoint(x: 35.33, y: 31.25), controlPoint1: CGPoint(x: 38.41, y: 24), controlPoint2: CGPoint(x: 35.33, y: 27.26))
    bezierPath.addLine(to: CGPoint(x: 35.33, y: 39.95))
    bezierPath.addCurve(to: CGPoint(x: 42.16, y: 47.2), controlPoint1: CGPoint(x: 35.33, y: 43.94), controlPoint2: CGPoint(x: 38.41, y: 47.2))
    bezierPath.close()
    
    //// Bezier 2 Drawing
    let bezier2Path = UIBezierPath()
    bezier2Path.move(to: CGPoint(x: 54.3, y: 41.96))
    bezier2Path.addCurve(to: CGPoint(x: 53.17, y: 40.31), controlPoint1: CGPoint(x: 54.42, y: 41.17), controlPoint2: CGPoint(x: 53.91, y: 40.43))
    bezier2Path.addCurve(to: CGPoint(x: 51.61, y: 41.52), controlPoint1: CGPoint(x: 52.42, y: 40.19), controlPoint2: CGPoint(x: 51.72, y: 40.73))
    bezier2Path.addCurve(to: CGPoint(x: 42.16, y: 50.1), controlPoint1: CGPoint(x: 50.89, y: 46.41), controlPoint2: CGPoint(x: 46.83, y: 50.1))
    bezier2Path.addCurve(to: CGPoint(x: 32.71, y: 41.51), controlPoint1: CGPoint(x: 37.49, y: 50.1), controlPoint2: CGPoint(x: 33.43, y: 46.41))
    bezier2Path.addCurve(to: CGPoint(x: 31.16, y: 40.3), controlPoint1: CGPoint(x: 32.6, y: 40.72), controlPoint2: CGPoint(x: 31.9, y: 40.18))
    bezier2Path.addCurve(to: CGPoint(x: 30.02, y: 41.96), controlPoint1: CGPoint(x: 30.41, y: 40.43), controlPoint2: CGPoint(x: 29.9, y: 41.16))
    bezier2Path.addCurve(to: CGPoint(x: 40.8, y: 52.91), controlPoint1: CGPoint(x: 30.88, y: 47.87), controlPoint2: CGPoint(x: 35.31, y: 52.28))
    bezier2Path.addLine(to: CGPoint(x: 40.8, y: 57.35))
    bezier2Path.addLine(to: CGPoint(x: 36.7, y: 57.35))
    bezier2Path.addCurve(to: CGPoint(x: 35.33, y: 58.8), controlPoint1: CGPoint(x: 35.94, y: 57.35), controlPoint2: CGPoint(x: 35.33, y: 58))
    bezier2Path.addCurve(to: CGPoint(x: 36.7, y: 60.25), controlPoint1: CGPoint(x: 35.33, y: 59.6), controlPoint2: CGPoint(x: 35.94, y: 60.25))
    bezier2Path.addLine(to: CGPoint(x: 47.62, y: 60.25))
    bezier2Path.addCurve(to: CGPoint(x: 48.99, y: 58.8), controlPoint1: CGPoint(x: 48.38, y: 60.25), controlPoint2: CGPoint(x: 48.99, y: 59.6))
    bezier2Path.addCurve(to: CGPoint(x: 47.62, y: 57.35), controlPoint1: CGPoint(x: 48.99, y: 58), controlPoint2: CGPoint(x: 48.38, y: 57.35))
    bezier2Path.addLine(to: CGPoint(x: 43.53, y: 57.35))
    bezier2Path.addLine(to: CGPoint(x: 43.53, y: 52.91))
    bezier2Path.addCurve(to: CGPoint(x: 54.3, y: 41.96), controlPoint1: CGPoint(x: 49.01, y: 52.28), controlPoint2: CGPoint(x: 53.44, y: 47.88))
    bezier2Path.close()

    bezierPath.append(bezier2Path)

    return bezierPath
}
