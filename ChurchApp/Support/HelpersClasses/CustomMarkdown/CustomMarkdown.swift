//
//  CustomMarkdown.swift
//  DgBetTrip
//
//  Created by Senior Developer on 28.04.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//
import UIKit
import MarkdownKit

class CustomMarkdown {
  
  private let markdownParser = MarkdownParser()
  private var changeText     : NSAttributedString!
  
  public func parse(parser: MKParser) -> NSAttributedString? {
    guard let textMessage = parser.textMessage else { return nil }
    self.changeText = NSAttributedString(string: textMessage)
    
    for regex in RegexMessage.allCases {
        
      switch regex {
        case .one, .two, .tree:
          self.changeText = self.regex(textMessage: self.changeText, regex: regex.rawValue)
        case .fore:
          self.changeText = self.link(atributedString: self.changeText, regex: regex.rawValue)
        
      }
    }
  return self.parser(parser).parse(self.changeText)
  }
  //MARK: - Regex
  private func regex(textMessage: NSAttributedString, regex: String) -> NSAttributedString {
    do{
      let regular = try NSRegularExpression(pattern: regex, options: [])
      //Получаем количество совпадений по данному regex
      let number = regular.numberOfMatches(in: textMessage.string, options: [], range: NSRange(location: 0, length: textMessage.string.count))
      for _ in 0...number {
        //Получаем диапазон расположения наиденого совпадения
        if let range = changeText.string.range(of: regex, options: .regularExpression){
          var removeText = self.changeText.string
          //Удаляем найденое совпадение из сообщения
          removeText.removeSubrange(range)
          self.changeText = NSAttributedString(string: removeText)
        }
      }
      return self.changeText
    } catch let error {
      print(error.localizedDescription, "Error delete information from mrssage")
      return self.changeText
    }
  }
  private func link(atributedString: NSAttributedString, regex: String) -> NSAttributedString? {
    let mutableAttributedString = NSMutableAttributedString(attributedString: atributedString)
    do{
      let result      = try NSRegularExpression(pattern: regex, options: [])
      let rangeSearch = NSRange(location: 0, length: atributedString.string.count)
      let text        = atributedString.string
      result.enumerateMatches(in: text, options: [], range: rangeSearch) { (checkingResult, _, _) in
        guard let checkingResult = checkingResult else { return }
        let range = NSRange(location: checkingResult.range.location, length: 12)
        if let url = URL(string: .typeLink(.diego)) {
          let yellowlink = [NSAttributedString.Key.foregroundColor: UIColor.set(.themeOne)]
          mutableAttributedString.addAttribute(.link, value: url, range: range)
          mutableAttributedString.addAttributes(yellowlink, range: range)
        }
      }
      return mutableAttributedString
    } catch let error {
      print(error.localizedDescription, "Error get check link @bDiegoGarcia")
      return mutableAttributedString
    }
  }
  private func parser(_ parser: MKParser) -> MarkdownParser {
    let markdownParser = MarkdownParser(font:  UIFont.set(.rubikRegular, parser.textSize), color: parser.textColor)
    markdownParser.bold.font    = .boldSystemFont(ofSize: 17)
    markdownParser.bold.color   =  parser.boldColor
    markdownParser.link.color   =  UIColor.set(.themeOne)
    markdownParser.italic.font  = .italicSystemFont(ofSize: 17)
    markdownParser.italic.color =  parser.italicColor
    markdownParser.header.color = .black
    markdownParser.header.font  = .boldSystemFont(ofSize: 18)
  return markdownParser
  }
}
