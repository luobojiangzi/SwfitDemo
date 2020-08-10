import UIKit

extension String {
    var legalUrlString: String? {
        if self.hasPrefix("http:") {
            return self.replacingOccurrences(of: "http:", with: "https:")
        }
        return nil
    }
    
    /**
     给String扩展 下标脚本 
     
     var str = "hangge.com"
     print(str[7,3])
     print(str[7])
      
     str[7,3] = "COM"
     str[0] = "H"
      
     print(str[0,10])
     */
    subscript(start:Int, length:Int) -> String
          {
          get{
              let index1 = self.index(self.startIndex, offsetBy: start)
              let index2 = self.index(index1, offsetBy: length)
              let range = Range(uncheckedBounds: (lower: index1, upper: index2))
              return String(self[range])
          }
          set{
              let tmp = self
              var s = ""
              var e = ""
              for (idx, item) in
                tmp.enumerated() {
                  if(idx < start)
                  {
                      s += "\(item)"
                  }
                  if(idx >= start + length)
                  {
                      e += "\(item)"
                  }
              }
              self = s + newValue + e
          }
      }
      subscript(index:Int) -> String
          {
          get{
              return String(self[self.index(self.startIndex, offsetBy: index)])
          }
          set{
              let tmp = self
              self = ""
              for (idx, item) in tmp.enumerated() {
                  if idx == index {
                      self += "\(newValue)"
                  }else{
                      self += "\(item)"
                  }
              }
          }
      }
    
}
