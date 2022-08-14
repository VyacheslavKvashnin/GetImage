//
//  ViewController.swift
//  GetImage
//
//  Created by Вячеслав Квашнин on 14.08.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var imageWidth = ""
    var imageHeight = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.layer.cornerRadius = 20
        
        let height = imageView.bounds.height
        imageHeight = String(format: "%.0f", Double(height))
        
        let width = imageView.bounds.width
        imageWidth = String(format: "%.0f", Double(width))
    }
    
    @IBAction func fetchImageButton(_ sender: Any) {
        fetch()
    }
    
    func fetch() {
        guard let url = URL(string: "https://picsum.photos/" + imageWidth + "/" + imageHeight) else { return }
        
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            guard let data = data else {
                return
            }
            DispatchQueue.main.async {
                self.imageView.image = UIImage(data: data)
            }
        }
        task.resume()
    }
}

