//
//  ListViewController.swift
//  SourcerySample
//
//  Created by ShinUnuma on 2019/03/31.
//  Copyright © 2019年 ShinUnuma. All rights reserved.
//

import Foundation
import UIKit

enum SolarSystem: String, CaseIterable {
    case sun = "sun"
    case mercury = "mercury"
    case venus = "venus"
    case earth = "earth"
    case mars = "mars"
    case jupiter = "jupiter"
    case saturn = "saturn"
    case uranus = "uranus"
    case neptune = "neptune"
    case pluto = "pluto"
}

class ListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let storyboard = self.storyboard else { return }
        guard let vc = storyboard.instantiateViewController(withIdentifier: "Detail") as? DetailViewController else { return }
        vc.update(detail: "This is \(SolarSystem.allCases[indexPath.row].rawValue)")
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SolarSystem.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = SolarSystem.allCases[indexPath.row].rawValue
        return cell
    }
}
