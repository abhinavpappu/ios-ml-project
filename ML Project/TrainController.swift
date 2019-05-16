//
//  TrainController.swift
//  ML Project
//
//  Created by Ugo Dos Reis on 5/8/19.
//  Copyright © 2019 Abhinav Pappu. All rights reserved.
//

import UIKit

class TrainController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {
let imagePicker = UIImagePickerController()
    
var faceImage: UIImage!
    var faceImageArray: [UIImage] = []
    var stringArray: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        // Do any additional setup after loading the view.
    }
    

    /*
     
     // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print("Picked image")
        
           self.faceImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        self.faceImageArray.append(self.faceImage)
        print(self.faceImageArray.count)
        imagePicker.dismiss(animated: true){
            
            
           
         
            

            
            
        }
        
    }
    
    

    @IBAction func uploadButtonTapped(_ sender: Any) {
        imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
        present(imagePicker, animated: true, completion: nil)
        

    }
    @IBAction func trainButtonTapped(_ sender: Any) {
        print("Send photos to server")
        for image in faceImageArray
        {
            let imageData: Data = image.pngData()!
            stringArray.append(imageData.base64EncodedString())
        }
    }
}
