//
//  ActionsBibleTextViewController.swift
//  ChurchApp
//
//  Created by Senior Developer on 05.10.2020.
//  Copyright © 2020 Developer. All rights reserved.
//
import UIKit

extension BibleTextViewController {
  
  @IBAction func backButton(button: UIButton){
    self.dismiss(animated: true)
  }
  @IBAction func previousChapterButton(button: UIButton){
    self.controllers.logic.previousNextButton(tag: button.tag)
  }
  @IBAction func nextChapterButton(button: UIButton){
    self.controllers.logic.previousNextButton(tag: button.tag)
  }
  @IBAction func editTextButton(button: UIButton){
    self.controllers.router.push(.EditText)
  }
  @IBAction func switchChapterButton(button: UIButton){
    self.controllers.logic.switchChapter(button: button)
  }
  @IBAction func switchPoemButton(button: UIButton){
    self.controllers.logic.switchPoem(button: button)
  }
  @IBAction func switchTranslateButton(button: UIButton){
    self.controllers.logic.switchTranslate(button: button)
  }
  @IBAction func shareButton(button: UIButton){
    self.controllers.logic.share()
  }
}
