//
//  ViewController.swift
//  ML Project
//
//  Created by Abhinav R. Pappu 2019 on 5/7/19.
//  Created by Ugo Dos Reis 2019
//  Copyright © 2019 Abhinav Pappu. All rights reserved.
//

//Commit by Anupam Murikurthy
//Commit by Shreya Viswanathan
//Commit by Shreya K
//Commit by Abhinav Pappu

import UIKit

class HomeController: UIViewController {

    @IBOutlet weak var uploadButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        uploadButton.backgroundColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
        uploadButton.layer.cornerRadius = uploadButton.frame.size.height/2
        uploadButton.layer.applySketchShadow(color: #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1), alpha: 0.5, x: 0, y: 0, blur: 10, spread: 10)
        
    }


}
extension CALayer {
    func applySketchShadow(
        color: UIColor = .black,
        alpha: Float = 0.5,
        x: CGFloat = 0,
        y: CGFloat = 2,
        blur: CGFloat = 4,
        spread: CGFloat = 0)
    {
        shadowColor = color.cgColor
        shadowOpacity = alpha
        shadowOffset = CGSize(width: x, height: y)
        shadowRadius = blur / 2.0
        if spread == 0 {
            shadowPath = nil
        } else {
            let dx = -spread
            let rect = bounds.insetBy(dx: dx, dy: dx)
            shadowPath = UIBezierPath(rect: rect).cgPath
        }
    }
}
