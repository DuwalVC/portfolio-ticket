//
//  CategoriaEntity.swift
//  Ticket2
//
//  Created by Duwal Abel Varillas Castro on 14/12/22.
//

import Foundation

struct CategoriaEntity{
    let codigo: Int
    let nombre: String
    
    static func mostrar(_ categorias: [CategoriaResponse]) -> [CategoriaEntity]{
        categorias.map { CategoriaEntity(codigo: $0.codigo, nombre: $0.nombre) }
    }
}
