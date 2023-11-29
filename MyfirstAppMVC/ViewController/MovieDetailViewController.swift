//
//  MovieDetailViewController.swift
//  MyfirstAppMVC
//
//  Created by Admin iMBC on 11/28/23.
//

import UIKit

class MovieDetailViewController: UIViewController {

    var movieDetailView = MovieDetailView()


    override func loadView() {
        self.view = movieDetailView
    }
    public var content : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        print("MovieDetailViewController called")
        movieDetailView.contentLabel.text = content

    }

}
