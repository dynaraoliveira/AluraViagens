//
//  Viagem.swift
//  Alura Viagens
//
//  Created by Dynara Rico Oliveira on 09/12/17.
//  Copyright © 2017 Dynara Rico Oliveira. All rights reserved.
//

import UIKit

class Viagem: NSObject {
    
    let titulo:String
    let quantidadeDeDias:Int
    let preco:String
    let caminhoDaImagem:String
    
    init(titulo:String, quantidadeDeDias:Int, preco:String, caminhoDaImagem:String) {
        self.titulo = titulo
        self.quantidadeDeDias = quantidadeDeDias
        self.preco = preco
        self.caminhoDaImagem = caminhoDaImagem
    }
}
