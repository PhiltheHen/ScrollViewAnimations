//
//  ViewController.swift
//  PullDownZoom
//
//  Created by Philip Henson on 11/29/15.
//  Copyright © 2015 Phil Henson. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var headerImage: UIImageView!

    let array = ["Line 1", "Line 2", "Line 3"]

    var originalFrame: CGRect?

    override func viewDidLoad() {
        super.viewDidLoad()
        headerImage.image = UIImage(named: "headerPic")
        tableView.reloadData()
        originalFrame = headerImage.frame
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell")

        cell?.textLabel?.text = array[indexPath.row]

        return cell!
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func scrollViewDidScroll(scrollView: UIScrollView) {
        let yPos = scrollView.contentOffset.y as CGFloat
        var avatarTransform = CATransform3DIdentity
        var headerTransform = CATransform3DIdentity

        if (yPos < 0) {
            let headerScaleFactor:CGFloat = -(yPos) / headerImage.bounds.height
            let headerSizevariation = ((headerImage.bounds.height * (1.0 + headerScaleFactor)) - headerImage.bounds.height)/2.0
            headerTransform = CATransform3DTranslate(headerTransform, 0, headerSizevariation, 0)
            headerTransform = CATransform3DScale(headerTransform, 1.0 + headerScaleFactor, 1.0 + headerScaleFactor, 0)

            headerImage.layer.transform = headerTransform
        }

    }


}

