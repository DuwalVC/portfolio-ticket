//
//  CategoriasViewController.swift
//  Ticket2
//
//  Created by Duwal Abel Varillas Castro on 14/12/22.
//

import UIKit


protocol CategoriasViewControllerProtocol: AnyObject {
    func montarListado(_ listaCategorias: [CategoriaEntity])
}

class CategoriasViewController: UIViewController {
    
    /// instancias Viper
    var presenter: CategoriasPresenterViewProtocol?
    /// listado
    var listadoCategoria: [CategoriaEntity] = []
    
    @IBOutlet weak var categoriasTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoriasTableView.dataSource = self
        categoriasTableView.delegate = self
        
        presenter?.obtenerCategorias()
    }

}

extension CategoriasViewController: CategoriasViewControllerProtocol{
    func montarListado(_ listaCategorias: [CategoriaEntity]) {
        listadoCategoria = listaCategorias
        categoriasTableView.reloadData()
    }
    
    
}

extension CategoriasViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listadoCategoria.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CategoriaIdentifier") as? CategoriaTableViewCell else {
            return CategoriaTableViewCell()
        }
        cell.nombreCategoriaLabel.text = listadoCategoria[indexPath.row].nombre
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("accion de celda -> tableviewdelegate")
        presenter?.solicitaPresentarListaCategoria(categoria: listadoCategoria[indexPath.row])
    }
    
}
