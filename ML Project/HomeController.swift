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

struct Thing : Codable {
    let model: String
    let image: String
}

class HomeController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let imagePicker = UIImagePickerController()
    var myImage: UIImage = UIImage()
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        let defaults = UserDefaults.standard
        
    }
    

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
                
                sendRequest(data: strBase64)
                
            }
        }
        
        
        alert.addAction(camera)
        alert.addAction(photoLibrary)
        present(alert, animated: true , completion: nil)
        
        
            
    }
    
    func sendRequest(data: String) {
        let thing = Thing(model: "kdg4zazx77.json", image: data)
        
        guard let uploadData = try? JSONEncoder().encode(thing) else {
            return
        }
        
        let url = URL(string: "http://157.56.176.151:3000/predict")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.uploadTask(with: request, from: uploadData) { data, response, error in
            if let error = error {
                print ("error: \(error)")
                return
            }
            guard let response = response as? HTTPURLResponse,
                (200...299).contains(response.statusCode) else {
                    print ("server error")
                    return
            }
            if let mimeType = response.mimeType,
                let data = data,
                let dataString = String(data: data, encoding: .utf8) {
                print(mimeType)
                print ("got data: \(dataString)")
            }
        }
        task.resume()
    }
    
    
}
    

