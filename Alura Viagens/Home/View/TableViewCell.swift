//
//  TableViewCell.swift
//  Alura Viagens
//
//  Created by Dynara Rico Oliveira on 09/12/17.
//  Copyright © 2017 Dynara Rico Oliveira. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var labelTitulo: UILabel!
    @IBOutlet weak var labelQuantidadeDias: UILabel!
    @IBOutlet weak var labelPreco: UILabel!
    @IBOutlet weak var imagemViagem: UIImageView!
    
    func formataCelula(viagem:Viagem){
        self.labelTitulo.text = viagem.titulo
        self.labelQuantidadeDias.text = viagem.quantidadeDeDias == 1 ? "1 dia" : "\(viagem.quantidadeDeDias) dias"
        self.labelPreco.text = "R$ \(viagem.preco)"
        self.imagemViagem.image = UIImage(named: viagem.caminhoDaImagem)
        self.imagemViagem.layer.cornerRadius = 10
        self.imagemViagem.layer.masksToBounds = true
    }
    
}
