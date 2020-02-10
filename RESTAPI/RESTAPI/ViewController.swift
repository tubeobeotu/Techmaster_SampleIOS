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
//        getEmployeeInfo()
        
//                let employeeRouter =  EmployeeRouter()
//                employeeRouter.endPoint = .getEmployees
//                employeeRouter.run { (json, error) in
//                    if let json = json {
//                        let employees = EmployeeModel.initModels(json: json)
//                        print("")
//                    } else {
//                        if let error = error {
//                            print(error)
//                        }
//                    }
//
//                }
        
        getEmployees()
    }
    
    @IBAction func onTouch(_ sender: Any) {
        getEmployeeInfo()
    }
    
    func getEmployeeInfo() {
        let url = String(format: "http://dummy.restapiexample.com/api/v1/employee/1")
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
                    
                    
                    
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                    if let myJson = json as? [String: Any]{
                        if let subMyJson = myJson["info"] as? [String: Any] {
                            print(subMyJson["employee_name"])
                        }
          
                    }
                    
                    
                    let fJson = try! JSON.init(data: data)
                    DispatchQueue.main.async {
                        self.lbName.text = fJson["info"]["employee_name"].string
                    }
                    
                    
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
    
    func getEmployees() {
        let url = String(format: "http://dummy.restapiexample.com/api/v1/employees")
        guard let serviceUrl = URL(string: url) else { return }
        let request = URLRequest(url: serviceUrl)
        let session = URLSession.shared
        
        session.dataTask(with: request) { (data, response, error) in
            print(data?.toString())
            //update UI => callback
            //            if let response = response {
            //                print(response)
            //            }
            //            if let data = data {
            //                do {
            //                    let json = try JSONSerialization.jsonObject(with: data, options: [])
            //                    print(json)
            //                } catch {
            //                    print(error)
            //                }
            //            }
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
