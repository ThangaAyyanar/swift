//
//  ViewHelper.swift
//  TotalityAssignment
//
//  Created by Thanga Ayyanar A on 03/11/21.
//

import UIKit

class ViewHelper {
    
    static func getUIView(color: UIColor) -> UIView {
        let view = UIView()
        view.backgroundColor = color
        view.layer.cornerRadius = 15
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    static func getImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }
    
    static func getUIButton(color: UIColor) -> UIButton {
        let button = UIButton()
        button.backgroundColor = color
        button.setTitle("More..", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    static func getUILabel(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    static func getUILabel() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
}
