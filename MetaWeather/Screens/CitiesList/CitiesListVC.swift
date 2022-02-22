//
//  CitiesListVC.swift
//  MetaWeather
//
//  Created by Mostafa Mahmoud on 19/02/2022.
//

import UIKit
import SwiftUI

class CitiesListVC: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    let citiesListVM = CitiesListVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Your cities"
        
        let cellNib = UINib(nibName: CitiesListCell.cellId, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: CitiesListCell.cellId)
        
        citiesListVM.cityModels.bind { [weak self] cityModel in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        
        citiesListVM.getCitiesList()
    }
}

// MARK: - UITableView
extension CitiesListVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        citiesListVM.cityModels.value?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: CitiesListCell.cellId) as? CitiesListCell,
            let cityModel = citiesListVM.cityModels.value?[indexPath.row]
        else {
            return UITableViewCell()
        }
        
        cell.configure(cityModel: cityModel)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cityDetailsView = CityDetailsView(cityDetailsVM: CityDetailsVM(cityModel: citiesListVM.cityModels.value![indexPath.row]))
        let cityDetailsVC = UIHostingController(rootView: cityDetailsView)
        present(cityDetailsVC, animated: true, completion: nil)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
