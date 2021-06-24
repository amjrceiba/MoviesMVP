//
//  ViewController.swift
//  MoviesMVP
//
//  Created by Andrés Mauricio Jaramillo Romero - Ceiba Software on 18/06/21.
//

import UIKit

class ViewController<ViewType: UIView>: UIViewController {

    // MARK: - Properties

    var customView: ViewType {
        return view as! ViewType
    }

    // MARK: - Life Cycle

    override func loadView() {
        view = ViewType(frame: UIScreen.main.bounds)
    }

}

