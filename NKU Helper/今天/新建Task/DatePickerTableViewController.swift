//
//  DatePickerTableViewController.swift
//  NKU Helper
//
//  Created by 陈乐天 on 16/7/29.
//  Copyright © 2016年 陈乐天. All rights reserved.
//

import UIKit

class DatePickerTableViewController: UITableViewController, UINavigationControllerDelegate {
    
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var noneCell: UITableViewCell!
    @IBOutlet var nextWeekCell: UITableViewCell!
    @IBOutlet var customCell: UITableViewCell!
    var datePickerVisible = false
    var optionChoosed = 0
    
    let PICKER_ROW = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        noneCell.accessoryType = .checkmark
        navigationController?.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        datePickerVisible = false
        datePicker.isHidden = true
    }
    
    private func showPickerCell() {
        datePickerVisible = true
        tableView.beginUpdates()
        datePicker.isHidden = false
        datePicker.alpha = 0
        UIView.animate(withDuration: 0.25, animations: { 
            self.datePicker.alpha = 1.0
        }) 
        tableView.endUpdates()
    }
    
    private func hidePickerCell() {
        datePickerVisible = false
        tableView.beginUpdates()
        UIView.animate(withDuration: 0.25, animations: {
            self.datePicker.alpha = 0
            }, completion: { (finished) in
                self.datePicker.isHidden = true
        }) 
        tableView.endUpdates()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath.row == PICKER_ROW) {
            return datePickerVisible ? 216 : 0
        }
        return ceil(tableView.rowHeight)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (indexPath.row == 2) {
            if !datePickerVisible {
                showPickerCell()
            }
        } else {
            if datePickerVisible {
                hidePickerCell()
            }
        }
        if (indexPath.row < PICKER_ROW) {
            optionChoosed = indexPath.row
            let cells = [noneCell, nextWeekCell, customCell]
            cells.forEach({ (cell) in
                cell?.accessoryType = .none
            })
            cells[indexPath.row]?.accessoryType = .checkmark
        }
        tableView.deselectRow(at: indexPath, animated: true)
        tableView.reloadData()
    }
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        if let controller = viewController as? NewTaskTableViewController {
            switch optionChoosed {
            case 0:
                controller.dueDate = nil
            case 1:
                controller.dueDate = CalendarHelper.buildDate(afterDays: 7)
            case 2:
                controller.dueDate = datePicker.date
            default:
                controller.dueDate = nil
            }
        }
    }
    
}
