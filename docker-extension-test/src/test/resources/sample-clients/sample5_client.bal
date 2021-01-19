// Copyright (c) 2019 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
//
// WSO2 Inc. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/io;
import ballerina/http;

public function main(string... args) {
    http:Client helloWorldEP = checkpanic new("http://" + <@untainted> args[0] + ":9090");

    var johnResp = helloWorldEP->get("/helloWorld/config/john");
    if (johnResp is http:Response) {
        io:println(johnResp.getTextPayload());
    }

    var janeResp = helloWorldEP->get("/helloWorld/config/jane");
    if (janeResp is http:Response) {
        io:println(janeResp.getTextPayload());
    }

    var dataResp = helloWorldEP->get("/helloWorld/data");
    if (dataResp is http:Response) {
        io:println(dataResp.getTextPayload());
    }
}
