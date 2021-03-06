//
//  TimeRecordViewController.swift
//  SleepSocial
//
//  Created by Vivian Lam on 2017-09-17.
//  Copyright © 2017 Sleep Social. All rights reserved.
//

import UIKit

class TimeRecordViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func wakeButtonPressed(_ sender: Any) {
        print("Wakeup pressed")
        recordWakeupTime()
    }
    
    @IBAction func sleepButtonPressed(_ sender: Any) {
        print("Sleep pressed")
        recordSleepTime()
    }
    

}
