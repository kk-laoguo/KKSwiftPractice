//
//  main.swift
//  POP
//
//  Created by zainguo on 2020/7/14.
//  Copyright © 2020 zainguo. All rights reserved.
//

import Foundation


func isArray(_ value: Any) -> Bool {
    value is [Any]
}

print(isArray([1, 2, 3]))
print(isArray(["1", 2, 3]))
print(isArray( NSArray() ) )
print(isArray( NSMutableArray() ) )
print(isArray("2333"))

protocol ArrayType {
    
}
extension Array: ArrayType {
    
}
extension NSArray: ArrayType {
    
}

//func isArrayType(_ type: Any.Type) -> Bool {
//    type is [Any].Type
//}

func isArrayType(_ type: Any.Type) -> Bool {
    type is ArrayType.Type
}
print("==========")
print( isArrayType([Int].self) )
print( isArrayType([Any].self) )
print( isArrayType(NSArray.self) )
print( isArrayType(NSMutableArray.self) )


