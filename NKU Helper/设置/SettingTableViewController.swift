//
//  SettingTableViewController.swift
//  NKU Helper
//
//  Created by 陈乐天 on 15/3/1.
//  Copyright (c) 2015年 陈乐天. All rights reserved.
//

import UIKit

class SettingTableViewController: UITableViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch (section) {
        case 0:return "账户信息"
        case 1:return "偏好设置"
        case 2:return "支持NKU Helper"
        case 3:return "关于NKU Helper\n"
        default:return ""
        }
    }

    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        switch (section) {
        case 0:return "NKU Helper将会把您的密码存储在系统钥匙串中，请放心填写"
        case 2:return "NKU Helper本身是完全免费的，但开发和运营都需要投入。如果您觉得好用并想鼓励我们做得更好，不妨通过捐赠来支持我们的团队。无论多少，我们都非常感谢！"
        case 3:return "如果大家对NKU Helper的使用有吐槽，或是希望有什么功能，欢迎到“关于”页面中戳我的邮箱，我会尽快给大家回复！\nNKU Helper已经开源，详情请见关于页面，欢迎大家一起为NKU Helper贡献代码"
        case 4:return "NKU Helper目前已有其他平台版本，在Google Play，百度，91助手和豌豆荚中均可下载"
        default:return ""
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0,2,3:
            return 1
        case 1:
            return 2
        case 4:
            return 0
        default:
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            do {
                let user = try UserAgent.sharedInstance.getUserInfo()
                let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.accountCell.identifier) as! AccountTableViewCell
                let timeEnteringSchool = (user.timeEnteringSchool as NSString).substring(with: NSMakeRange(2, 2))
                cell.nameLabel.text = user.name
                cell.userIDLabel.text = user.userID
                cell.departmentLabel.text = user.departmentAdmitted + (timeEnteringSchool as String) + "级本科生"
                return cell
            } catch {
                let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.addAccountCell.identifier)!
                cell.textLabel?.text = "请先登录！"
                cell.detailTextLabel?.text = "欢迎使用NKU Helper！"
                return cell
            }
        case 1:
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.choosePreferredColorCell.identifier)!
                return cell
            }
            else {
                let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.chooseClassTimeTablePreferenceCell.identifier)!
                return cell
            }
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.supportGroupCell.identifier)!
            cell.textLabel?.text = "请开发团队喝一杯咖啡"
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.aboutCell.identifier)!
            cell.textLabel?.text = "关于"
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.aboutCell.identifier)!
            return cell
        }
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 2 {
            let url = URL(string: "https://qr.alipay.com/ae5g3m2kfloxr5tte5")!
            UIApplication.shared.openURL(url)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        segue.destination.hidesBottomBarWhenPushed = true
    }
    
}
