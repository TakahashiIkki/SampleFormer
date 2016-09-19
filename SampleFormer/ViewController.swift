//
//  ViewController.swift
//  SampleFormer
//
//  Created by 一騎高橋 on 2016/09/19.
//  Copyright © 2016年 IkkiTakahashi. All rights reserved.
//

import UIKit
import Former

class ViewController: FormViewController {

    let createHeader: (String -> ViewFormer) = { text in
        return LabelViewFormer<FormLabelHeaderView>()
            .configure {
                $0.viewHeight = 40
                $0.text = text
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let NumberLabelRow = LabelRowFormer<FormLabelCell>() {
                $0.formSubTextLabel()?.textColor = UIColor.blackColor()
                $0.formSubTextLabel()?.textAlignment = .Left
            }.configure {
                $0.text = "Number"
                $0.subText = "001"
            }.onSelected { [weak self] _ in
                self?.former.deselect(true)
        }
 
        let NameLabelRow = LabelRowFormer<FormLabelCell>() {
            $0.formSubTextLabel()?.textColor = UIColor.blackColor()
            $0.formSubTextLabel()?.textAlignment = .Left
            }.configure {
                $0.text = "Name   "
                $0.subText = "あああああ"
            }.onSelected { [weak self] _ in
                self?.former.deselect(true)
        }
        
        let getSegmentRow = SegmentedRowFormer<FormSegmentedCell>() {
            $0.titleLabel.text = "捕まえた？"
            }.configure {
                $0.segmentTitles = ["見た事ない", "見つけた", "捕まえた"]
                $0.selectedIndex = 0
            }.onSegmentSelected { [weak self] _ in
                print("selected")
        }
        
        let introductionRow = TextViewRowFormer<FormTextViewCell>() {
            $0.textView.font = .systemFontOfSize(15)
            }.configure {
                $0.placeholder = "Add your self-introduction"
                $0.text = ""
            }.onTextChanged { [weak self] _ in
                print("aaa")
        }
        
        let sectionFormer1 = SectionFormer(rowFormer: NumberLabelRow, NameLabelRow)
            .set(headerViewFormer: createHeader("About"))

        let sectionFormer2 = SectionFormer(rowFormer: getSegmentRow)
        
        let sectionFormer3 = SectionFormer(rowFormer: introductionRow)
            .set(headerViewFormer: createHeader("Memo"))
        
        former.append(sectionFormer: sectionFormer1, sectionFormer2, sectionFormer3)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

