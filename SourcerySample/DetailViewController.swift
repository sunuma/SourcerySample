//
//  DetailViewController.swift
//  SourcerySample
//
//  Created by ShinUnuma on 2019/03/31.
//  Copyright © 2019年 ShinUnuma. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var detail: UILabel!
    private var text: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detail.text = text
    }
    
    func update(detail: String) {
        self.text = detail
    }
}
