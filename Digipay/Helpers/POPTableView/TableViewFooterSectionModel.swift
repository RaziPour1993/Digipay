//
//  TableViewFooterSectionModel.swift
//  Avicenna
//
//  Created by Mohammad Razipour on 10/1/19.
//  Copyright © 2019 ConicSoftwareSolutions. All rights reserved.
//

import Foundation

protocol TableViewFooterSectionModel {
    func identifier() -> String
}

protocol ConfigurableTableViewFooterSectionModel {
    func configure(with model: TableViewFooterSectionModel)
}
