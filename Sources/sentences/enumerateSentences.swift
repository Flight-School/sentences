import Foundation
#if canImport(NaturalLanguage)
import NaturalLanguage
#endif

func enumerateSentences(in string: String, using block: (String) -> Void) {
    if #available(OSX 10.14, *) {
        let tagger = NLTagger(tagSchemes: [.tokenType])
        tagger.string = string
        tagger.enumerateTags(in: string.startIndex..<string.endIndex, unit: .sentence, scheme: .tokenType, options: []) { (tag, range) in
            block(String(string[range]))
            return true
        }
    } else if #available(OSX 10.13, *) {
        let tagger = NSLinguisticTagger(tagSchemes: [.tokenType], options: 0)
        tagger.string = string
        tagger.enumerateTags(in: NSRange(string.startIndex..<string.endIndex, in: string), unit: .sentence, scheme: .tokenType, options: []) { (tag, range, _) in
                block((string as NSString).substring(with: range))
        }
    }
}
