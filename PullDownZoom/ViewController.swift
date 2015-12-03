//
//  ViewController.swift
//  PullDownZoom
//
//  Created by Philip Henson on 11/29/15.
//  Copyright © 2015 Phil Henson. All rights reserved.
//
//  With help from Mattew Cheok's Blog: http://blog.matthewcheok.com/design-teardown-stretchy-headers/

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var headerImage: UIImageView!

    var headerView: UIView!

    let array = ["Line 1", "Line 2", "Line 3"]


    override func viewDidLoad() {
        super.viewDidLoad()


        headerView = tableView.tableHeaderView
        tableView.tableHeaderView = nil
        tableView.addSubview(headerView)

        tableView.contentInset = UIEdgeInsets(top: 300, left: 0, bottom: 0, right: 0)
        tableView.contentOffset = CGPoint(x: 0, y: -280) // needs to be 280 because table view is offset by 20 from the top of the superview
        updateHeaderView()
        tableView.reloadData()

    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell")

        cell?.textLabel?.text = array[indexPath.row]

        return cell!
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func updateHeaderView() {
        var headerRect = CGRect(x: 0, y: -300, width: tableView.bounds.width, height: 300)
        if tableView.contentOffset.y < -300 {
            headerRect.origin.y = tableView.contentOffset.y
            headerRect.size.height = -tableView.contentOffset.y
        }
        headerView.frame = headerRect
    }

    func scrollViewDidScroll(scrollView: UIScrollView) {
        updateHeaderView()
    }


}

