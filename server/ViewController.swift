//
//  ViewController.swift
//  server
//
//  Created by Marni Anuradha on 12/12/19.
//  Copyright © 2019 Marni Anuradha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var urlReqObj : URLRequest!
    var imageObject : UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        assignImagesFromURL()
        // Do any additional setup after loading the view.
    }

    func assignImagesFromURL()
    {
        imageObject = UIImageView()
        imageObject.frame = CGRect(x: 0, y: 20, width: 400, height: 184)
        view.addSubview(imageObject)
        urlReqObj = URLRequest(url: URL(string:"https://www.brninfotech.com/tws/media/saaho/poster.jpg")!)
                urlReqObj.httpMethod = "GET"
                var dataTask = URLSession.shared.dataTask(with: urlReqObj {
                    (data, res, err) in
                    print(data!)
                    do{
                        var convertedData = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as! [String]
                        print(convertedData)
                    }
                    catch{
                        print("Wrong")
                    }
                    DispatchQueue.main.async{
                        self.imageObject.image = UIImage(data: data!)
                    }
                    
        })
                dataTask.resume()
        }
    @IBAction func getMoviesData(_ sender: UIButton) {
     assignImagesFromURL()
    }

}
