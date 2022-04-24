//
//  ImagePickerAlertManager.swift
//  
//
//  Created by Арман Чархчян on 13.04.2022.
//

import UIKit

public protocol ImagePickerAlertManagerDelegate: UIViewController,
                                                 UIImagePickerControllerDelegate,
                                                 UINavigationControllerDelegate { }

extension UIViewController: ImagePickerAlertManagerDelegate {

    private enum ActionsStrings: String {
        case camera = "Камера"
        case photos = "Фотографии"
        case cancel = "Отмена"
    }

    public func presentImagePicker() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        
        let imagePickerAlert = UIAlertController(title: nil,
                                                 message: nil,
                                                 preferredStyle: .actionSheet)
        let cameraAction = UIAlertAction(title: ActionsStrings.camera.rawValue,
                                         style: .default) { _ in
            imagePicker.sourceType = .camera
            self.present(imagePicker, animated: true, completion: nil)
        }
        let galaryAction = UIAlertAction(title: ActionsStrings.photos.rawValue,
                                         style: .default) { _ in
            imagePicker.sourceType = .photoLibrary
            self.present(imagePicker, animated: true, completion: nil)
        }
        let cancelAction = UIAlertAction(title: ActionsStrings.cancel.rawValue, style: .cancel, handler: nil)
        imagePickerAlert.addAction(cameraAction)
        imagePickerAlert.addAction(galaryAction)
        imagePickerAlert.addAction(cancelAction)
        self.present(imagePickerAlert, animated: true, completion: nil)
    }
}
