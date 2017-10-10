//
//  Routes.swift
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

import PerfectHTTPServer

func mainRoutes() -> [[String: Any]] {

	var routes: [[String: Any]] = [[String: Any]]()
	// Special healthcheck
	routes.append(["method":"get", "uri":"/healthcheck", "handler":Handlers.healthcheck])

	// Handler for home page
	routes.append(["method":"get", "uri":"/", "handler":Handlers.main])

	// Handler for JSON GET
	routes.append(["method":"get", "uri":"/api/v1/test", "handler":Handlers.JSONtestGET])

	// Handler for JSON POST
	routes.append(["method":"post", "uri":"/api/v1/test", "handler":Handlers.JSONtestPOST])

	// Handler for JSON POST with URL Param
	routes.append(["method":"post", "uri":"/api/v1/testparam", "handler":Handlers.JSONtestPOSTvarURL])

	// Handler for JSON POST with JSON Body
	routes.append(["method":"post", "uri":"/api/v1/testbody", "handler":Handlers.JSONtestPOSTbody])


	return routes
}
