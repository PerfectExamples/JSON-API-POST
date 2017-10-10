//
//  Handlers.swift
//  Perfect-App-Template
//
//  Created by Jonathan Guthrie on 2017-02-20.
//	Copyright (C) 2017 PerfectlySoft, Inc.
//
//===----------------------------------------------------------------------===//
//
// This source file is part of the Perfect.org open source project
//
// Copyright (c) 2015 - 2016 PerfectlySoft Inc. and the Perfect project authors
// Licensed under Apache License v2.0
//
// See http://perfect.org/licensing.html for license information
//
//===----------------------------------------------------------------------===//
//

import PerfectHTTP
import StORM

class Handlers {

	// Basic "main" handler - simply outputs "Hello, world!"
	static func main(data: [String:Any]) throws -> RequestHandler {
		return {
			request, response in
			response.setBody(string: "<html><title>Hello, world!</title><body>Hello, world!</body></html>")
			response.completed()
		}
	}

	// Basic "JSON GET" handler
	static func JSONtestGET(data: [String:Any]) throws -> RequestHandler {
		return {
			request, response in
			do {
				try response.setBody(json: ["message":"Hello, World!, This is a GET Request"])
			} catch {
				print(error)
			}
			response.completed()
		}
	}

	// Basic "JSON POST" handler
	static func JSONtestPOST(data: [String:Any]) throws -> RequestHandler {
		return {
			request, response in
			do {
				try response.setBody(json: ["message":"Hello, World! This is a POST Request"])
			} catch {
				print(error)
			}
			response.completed()
		}
	}

	// "JSON POST" handler that uses URL Param
	static func JSONtestPOSTvarURL(data: [String:Any]) throws -> RequestHandler {
		return {
			request, response in
			do {
				if let name = request.param(name: "name") {
					try response.setBody(json: ["message":"Hello, \(name)!"])
				} else {
					try response.setBody(json: ["message":"Hello, World! I can personalize this if you let me?"])
				}
			} catch {
				print(error)
			}
			response.completed()
		}
	}


	// "JSON POST" handler that uses Post Body
	static func JSONtestPOSTbody(data: [String:Any]) throws -> RequestHandler {
		return {
			request, response in
			do {
				if let body = request.postBodyString {
					let json = try body.jsonDecode() as? [String:Any]
					let name = json?["name"] as? String ?? "Undefined"
					try response.setBody(json: ["message":"Hello, \(name)!"])
				} else {
					try response.setBody(json: ["message":"Hello, World! I can personalize this if you let me?"])
				}
			} catch {
				print(error)
			}
			response.completed()
		}
	}

}
