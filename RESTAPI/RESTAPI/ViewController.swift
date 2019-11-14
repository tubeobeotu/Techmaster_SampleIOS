//
//  ViewController.swift
//  RESTAPI
//
//  Created by Nguyễn Văn Tú on 11/14/19.
//  Copyright © 2019 Nguyễn Văn Tú. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getEmployee()
    }
    
    func getEmployee() {
        let url = String(format: "http://dummy.restapiexample.com/api/v1/employees")
        guard let serviceUrl = URL(string: url) else { return }
        let request = URLRequest(url: serviceUrl)
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let response = response {
                print(response)
            }
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
    
    func addEmployee() {
        let url = String(format: "http://dummy.restapiexample.com/api/v1/create")
        guard let serviceUrl = URL(string: url) else { return }
        let parameterDictionary = ["name":"test12311","salary":"123","age":"23"]
        var request = URLRequest(url: serviceUrl)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameterDictionary, options: [.fragmentsAllowed]) else {
            return
        }
        request.httpBody = httpBody
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let response = response {
                print(response)
            }
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                } catch {
                    print(data.toString() ?? "")
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
