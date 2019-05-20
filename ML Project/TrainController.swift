//
//  TrainController.swift
//  ML Project
//
//  Created by Ugo Dos Reis on 5/8/19.
//  Copyright © 2019 Abhinav Pappu. All rights reserved.
//

import UIKit

struct Thing2 : Codable {
    let images: [String]
}

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
        let defaults = UserDefaults.standard
        defaults.set(stringArray, forKey: "images")
      
        sendRequest(data: stringArray)
    }
    
    func sendRequest(data: [String]) {
        print("Sending Request")
        let thing = Thing2(images: data)
        
        guard let uploadData = try? JSONEncoder().encode(thing) else {
            return
        }
        
        let url = URL(string: "http://157.56.176.151:3000/train")!
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
                let defaults = UserDefaults.standard
                defaults.set(dataString, forKey: "data string")
                
                let alert = UIAlertController(title: "Training Complete", message: "model name = \(dataString)", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "ok", style: .default))
                self.present(alert, animated: true)
                
            }
        }
        task.resume()
    }
}
    
    

