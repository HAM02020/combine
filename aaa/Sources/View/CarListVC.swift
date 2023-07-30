//
//  CarList.swift
//  aaa
//
//  Created by my on 2023/7/28.
//

import UIKit
import Combine
class CarListVC: UIViewController{
    
    private var cancelableSet: Set<AnyCancellable> = []
    
    lazy var vm: CarListVM = {
        let vm = CarListVM()
        
        return vm
    }()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        title = "Car List"
        view.backgroundColor = .white
        
        view.addSubview(tableView)
        tableView.frame = view.bounds
        vm.$cars.receive(on: RunLoop.main).sink(receiveValue: {[weak self] _ in
            self?.tableView.reloadData()
        }).store(in: &cancelableSet)
        Task{
            await vm.fetchCars()
        }
        
        
        
    }
    
    lazy var tableView: UITableView = {
        let v = UITableView()
        v.dataSource = self
        v.delegate = self
        v.register(UINib(nibName: "Cell", bundle: nil), forCellReuseIdentifier: "cell")
        return v
    }()
    
}

extension CarListVC: UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(vm.cars.count)
        return vm.cars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! Cell
        cell.name.text = vm.cars[indexPath.row].name
        cell.price.text = vm.cars[indexPath.row].price.description
        
        return cell
    }
    
    
}
