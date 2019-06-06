//
//  ViewController.swift
//  FinalClassProject2
//
//  Created by Chinedu Nmezi on 2019-06-04.
//  Copyright © 2019 Chinedu Nmezi. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    struct OrgImg {
        static var name = UIImage.init()
        
    }
    
    
   
    @IBOutlet weak var ImgViewController: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
               OrgImg.name = ImgViewController.image!
        ImgPicker.delegate = self
        // Do any additional setup after loading the view.
        
    }
    
    
    @IBAction func ChaneImage(_ sender: Any) {
        
        ImgViewController.image = UIImage(named: "DaddyHezekiah")
        
        let inputImg = UIImage()
        
        let rawImg = CIImage(image: inputImg)
        
    }
    
    @IBAction func ChangEffect(_ sender: Any) {
        
        let inputImg = ImgViewController.image!
        
        
        let rawImg = CIImage(image: inputImg)
        
        //let sepiaParams: [String : Any] = [kCIInputImageKey : rawImg  ]    }
        
        let cropParams: [String : Any] = [kCIInputImageKey : rawImg, "inputSize" : CIVector(string:"[100 100]") , "inputCropAmount" : 1 , "inputCenterStretchAmount" : 1]
        
        
        let sepiaFilter = CIFilter(name: "CIStretchCrop", parameters: cropParams)
        
        let context = CIContext(options: nil)
        
        if let output = sepiaFilter?.outputImage{
            
            if let ciImg = context.createCGImage(output, from: output.extent){
                
                ImgViewController.image = UIImage(cgImage:ciImg)
            }

}

}
    
        
    
    
    @IBOutlet weak var ImgPlaceHolder: UIImageView!
    var ImgPicker = UIImagePickerController()
    
    
    func ResetBtn(_ sender: Any) {
        ImgViewController.image = OrgImg.name
       
    }
    
    @IBAction func BtnClick(_ sender: Any) {
        ImgPicker.sourceType = .photoLibrary
        
        present(ImgPicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let userSelection = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        
            //info[UIImagePickerController.InfoKey.editedImage] as? UIImagePickerController
        
        ImgPlaceHolder.image = userSelection
        
        dismiss(animated: true, completion: nil)
        
    }
    
}


