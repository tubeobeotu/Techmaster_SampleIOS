//
//  ViewController.swift
//  UITableView
//
//  Created by Nguyễn Văn Tú on 1/16/20.
//  Copyright © 2020 Nguyễn Văn Tú. All rights reserved.
//

import UIKit

class FeedsVC: UIViewController {
    @IBOutlet weak var tbl_Content: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tbl_Content.register(UINib.init(nibName: "ItemFeedsCell", bundle: nil), forCellReuseIdentifier: "ItemFeedsCell")
        self.tbl_Content.delegate = self
        self.tbl_Content.dataSource = self
        self.tbl_Content.estimatedRowHeight = 300
    }
}

extension FeedsVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? ItemFeedsCell {
            
        }
        print("")
    }
}

extension FeedsVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ItemFeedsCell", for: indexPath) as? ItemFeedsCell {
            return cell
        }
        return UITableViewCell()
    }
}

