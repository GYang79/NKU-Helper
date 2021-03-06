//
//  DetailAccountInfoTableViewController.swift
//  NKU Helper
//
//  Created by 陈乐天 on 15/3/6.
//  Copyright (c) 2015年 陈乐天. All rights reserved.
//

import UIKit

class DetailAccountInfoTableViewController: UITableViewController {

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 5
        }
        else {
            return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.accountInfoCell.identifier)!
            do {
                let userInfo = try UserAgent.sharedInstance.getUserInfo()
                switch indexPath.row {
                case 0:
                    cell.textLabel?.text = "姓名"
                    cell.detailTextLabel?.text = userInfo.name
                case 1:
                    cell.textLabel?.text = "学号"
                    cell.detailTextLabel?.text = userInfo.userID
                case 2:
                    cell.textLabel?.text = "入学时间"
                    cell.detailTextLabel?.text = userInfo.timeEnteringSchool
                case 3:
                    cell.textLabel?.text = "所在院系"
                    cell.detailTextLabel?.text = userInfo.departmentAdmitted
                case 4:
                    cell.textLabel?.text = "所在专业"
                    cell.detailTextLabel?.text = userInfo.majorAdmitted
                default:
                    break
                }
            } catch {
                
            }
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.logOutCell.identifier)!
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            let userAgent = UserAgent.sharedInstance
            do {
                try userAgent.delete()
                try CourseTime.deleteAllCourseTimes()
                try Task.deleteCourseTasks()
                try Course.deleteAllCourses()
                NotificationCenter.default.post(name: Foundation.Notification.Name(rawValue: "logout"), object: self)
                let _ = self.navigationController?.popToRootViewController(animated: true)
            } catch {
                self.present(ErrorHandler.alertWith(title: "登出失败", message: "删除数据失败，请重试", cancelButtonTitle: "好"), animated: true, completion: nil)
            }
        }
    }

}
