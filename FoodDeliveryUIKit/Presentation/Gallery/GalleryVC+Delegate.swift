//
//  GalleryVC+Delegate.swift
//  FoodDeliveryUIKit
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 28/10/23.
//

import Foundation
import PhotosUI

//extension GalleryViewController: PHPickerViewControllerDelegate {
//    
//    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
//        picker.dismiss(animated: true)
//        
//        if let itemprovider = results.first?.itemProvider {
//            if itemprovider.canLoadObject(ofClass: UIImage.self) {
//                itemprovider.loadObject(ofClass: UIImage.self) { (image: NSItemProviderReading?, error: Error?) in
//                    if let selectedImage = image as? UIImage {
//                        DispatchQueue.main.async {
//                            self.imageView.image = selectedImage
//                        }
//                    }
//                }
//            }
//        }
//    }
//}

extension GalleryViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true)
        if let itemprovider = results.first?.itemProvider{
          
            if itemprovider.canLoadObject(ofClass: UIImage.self){
               
                itemprovider.loadObject(ofClass: UIImage.self) { image , error  in
                    if let selectedImage = image as? UIImage{
                        DispatchQueue.main.async {
                            self.imageView.image = selectedImage
                        }
                    }
                }
            }
            
        }
    }
}
