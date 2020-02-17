//
//  ViewController.swift
//  RESTAPI
//
//  Created by Nguyễn Văn Tú on 11/14/19.
//  Copyright © 2019 Nguyễn Văn Tú. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController {
    
    @IBOutlet weak var requestBtn: UIButton!
    @IBOutlet weak var lbName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getMovies()
    }
    
    @IBAction func onTouch(_ sender: Any) {
    
    }
    
    func getMovies() {
        let url = MovieActionType.discover(page: 1).path
        guard let serviceUrl = URL(string: url) else { return }
        let request = URLRequest(url: serviceUrl)
        let session = URLSession.shared
        
        session.dataTask(with: request) { (data, response, error) in
            //update UI => callback
            if let response = response {
                print(response)
            }
            if let data = data {
                do {
                    print(data.toString())
                } catch {
                    print(error)
                }
            }
        }.resume()
    }

}



extension Data
{
    func toString() -> String?
    {
        return String(data: self, encoding: .utf8)
    }
}
