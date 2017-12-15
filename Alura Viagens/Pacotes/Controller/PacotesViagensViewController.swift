//
//  PacotesViagensViewController.swift
//  Alura Viagens
//
//  Created by Dynara Rico Oliveira on 10/12/17.
//  Copyright © 2017 Dynara Rico Oliveira. All rights reserved.
//

import UIKit

class PacotesViagensViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UISearchBarDelegate {

    @IBOutlet weak var colecaoPacotesViagem: UICollectionView!
    @IBOutlet weak var procurarPacotesViagem: UISearchBar!
    @IBOutlet weak var contadorPacotesViagem: UILabel!
    
    let listaComTodasViagens:Array<PacoteViagem> = PacoteViagemDAO().retornaTodasAsViagens()
    var listaViagens:Array<PacoteViagem> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colecaoPacotesViagem.dataSource = self
        colecaoPacotesViagem.delegate = self
        procurarPacotesViagem.delegate = self
        
        listaViagens = listaComTodasViagens
        contadorPacotesViagem.text = atualizaContadorPacotesViagem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listaViagens.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellPacote = collectionView.dequeueReusableCell(withReuseIdentifier: "cellPacote", for: indexPath) as! PacoteViagemCollectionViewCell
        let pacoteAtual = listaViagens[indexPath.item]
        cellPacote.formataCelula(pacote: pacoteAtual)
        return cellPacote
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        //let larguraColecao = collectionView.bounds.width/2
        //return CGSize(width: larguraColecao-15, height: 160)
        
        return UIDevice.current.userInterfaceIdiom == .phone ? CGSize(width: collectionView.bounds.width/2-20, height: 160) : CGSize(width: collectionView.bounds.width/3-20, height: 250)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let pacote = listaViagens[indexPath.item]
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "detalhes") as! DetalhesViagensViewController
        controller.pacoteSelecionado = pacote
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        listaViagens = listaComTodasViagens
        
        if searchText != "" {
            listaViagens = listaViagens.filter { $0.viagem.titulo.contains(searchText) }
        }
        
        contadorPacotesViagem.text = atualizaContadorPacotesViagem()
        colecaoPacotesViagem.reloadData()
    }
    
    func atualizaContadorPacotesViagem() -> String {
        return listaViagens.count == 1 ? "1 pacote encontrado" : "\(listaViagens.count) pacotes encontrados"
    }
    
}
