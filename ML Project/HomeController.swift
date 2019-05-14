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

class HomeController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let imagePicker = UIImagePickerController()
    var myImage: UIImage = UIImage()
    
    

    @IBOutlet weak var uploadButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        
    }

    @IBAction func uploadButtonTapped(_ sender: UIButton) {
          let alert = UIAlertController(title: "Upload Image", message: "", preferredStyle: .alert)
        let camera = UIAlertAction(title: "Camera", style: .default) {(action) in
            print("camera button tapped")
            if UIImagePickerController.isSourceTypeAvailable(.camera)
            {
                self.imagePicker.sourceType = UIImagePickerController.SourceType.camera
                
            }
            else
            {
                self.imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
            }
            
        }
        let photoLibrary = UIAlertAction(title: "Photo Library", style: .default) {(action) in
            print ("library button tapped")
            self.imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
            self.present(self.imagePicker, animated: true, completion: nil)
        }
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            print ("Picked image")
            imagePicker.dismiss(animated: true) {
                self.myImage = (info[UIImagePickerController.InfoKey.originalImage] as? UIImage)!
                let  imageData: Data = self.myImage.pngData()!
                let strBase64 = imageData.base64EncodedString()
                
                
                
            }
        }
        alert.addAction(camera)
        alert.addAction(photoLibrary)
        present(alert, animated: true , completion: nil)
        
        
            
        }
    }
    

