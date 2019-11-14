//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Patrick Millet on 11/14/19.
//  Copyright © 2019 Patrick Millet. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {

    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    @IBOutlet weak var imageViewOutlet: UIImageView!
    @IBOutlet weak var textFieldOutlet: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addPhotoTapped(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self

        let alertcontroller = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertcontroller.addAction(cancelAction)

        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default, handler: {
                (_) in imagePicker.sourceType = .photoLibrary
                self.present(imagePicker, animated: true, completion: nil)
            })
            alertcontroller.addAction(photoLibraryAction)
        }

        present(alertcontroller, animated: true, completion: nil)
    }
    @IBAction func savePhotoTapped(_ sender: Any) {
        guard let name = textFieldOutlet.text, let data = imageViewOutlet.image?.pngData() else { return }
        if let photo = photo {
            photoController?.update(photo: photo, named: name, with: data)
        } else {
            photoController?.createPhoto(named: name, with: data)
        }
        navigationController?.popViewController(animated: true)
    }
    
    
    private func setTheme() {
        guard let themePreference = themeHelper?.themePreference else { return }
           if themePreference == "Red" {
               view.backgroundColor = .red
           } else if themePreference == "Dark" {
               view.backgroundColor = .darkGray
           } else { view.backgroundColor = .none }
       }
    
    private func updateViews() {
        setTheme()
        guard let imageData = photo?.imageData else { return }
        
        imageViewOutlet.image = UIImage(data: imageData)
        textFieldOutlet.text = photo?.title
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}


    extension PhotoDetailViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            guard let image = info[.originalImage] as? UIImage, let data = image.pngData() else { return }

            photo?.imageData = data
            imageViewOutlet.image = image

            dismiss(animated: true, completion: self.updateViews)
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            dismiss(animated: true, completion: nil)
    }
}

