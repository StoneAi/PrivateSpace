//
//  MacroConfig.swift
//  STPrivateSpace
//
//  Created by 那不是随你 on 2022/2/14.
//

import Foundation


func printLog<T>(_ message: T, fileName: String = #file, methodName: String = #function, lineNumber: Int = #line){
    //文件名、方法、行号、打印信息
    print("\n--------------------------------\n文件:\(fileName)\n方法:\(methodName)  行号:\(lineNumber)\n打印信息:\n\(message)\n");
}
