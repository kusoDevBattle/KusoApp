//
//  CameraViewController.swift
//  KusoApp
//
//  Created by ANNotunzdY on 2017/03/04.
//  Copyright © 2017 Kibousoft LLC. All rights reserved.
//

import UIKit

class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func openCamera(_ sender: Any) {
        
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
            return
        }
        
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        let label = UILabel(frame: view.bounds)
        label.text = "💩"
        label.font = UIFont.systemFont(ofSize: 300)
        picker.cameraOverlayView = label
        picker.delegate = self
        present(picker, animated: true, completion: nil)
    }
    
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        dismiss(animated: false, completion: { [unowned self] in
            let alert = UIAlertController(title: "保存したくない", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "また今度", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        })
    }
    
    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: false, completion: nil)
    }

}
