//
//  ViewCode.swift
//  HorrorBox
//
//  Created by Hiago Chagas on 04/02/21.
//

import Foundation

protocol ViewCode {
    /// Use this method to add subviews
    func setViewHierarchy()
    /// Use this method to organize your constraints. User another functions if needed.
    func setConstraints()
    /// Function that calls the other methods. Call it inside your init, for instance.
    func setupViewCode()
}

extension ViewCode {
    func setupViewCode() {
        setViewHierarchy()
        setConstraints()
    }
}
