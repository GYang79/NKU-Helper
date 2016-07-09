//
//  ClassToEvaluateTableViewCell.swift
//  NKU Helper
//
//  Created by 陈乐天 on 1/21/16.
//  Copyright © 2016 &#38472;&#20048;&#22825;. All rights reserved.
//

import UIKit

class ClassToEvaluateTableViewCell: UITableViewCell {

    var classToEvaluate: ClassToEvaluate! {
        didSet {
            self.classNameAndTeacherNameLabel.text = classToEvaluate.className + " - " + classToEvaluate.teacherName
            self.hasEvaluatedImageView.image = classToEvaluate.hasEvaluated ? UIImage(named: "classEvaluated") : UIImage(named: "classNotEvaluated")
        }
    }
    
    @IBOutlet var classNameAndTeacherNameLabel: UILabel!
    @IBOutlet var hasEvaluatedImageView: UIImageView!
    
}