/**
 *    Copyright 2019 MetaRing s.r.l.
 *
 *    Licensed under the Apache License, Version 2.0 (the "License");
 *    you may not use this file except in compliance with the License.
 *    You may obtain a copy of the License at
 *
 *        http://www.apache.org/licenses/LICENSE-2.0
 *
 *    Unless required by applicable law or agreed to in writing, software
 *    distributed under the License is distributed on an "AS IS" BASIS,
 *    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *    See the License for the specific language governing permissions and
 *    limitations under the License.
 */

package com.metaring.generator.model.factories

import com.metaring.generator.model.data.Module

interface ModuleFactory {
    def String getModuleInfoFilename(Module module)
    def String getModuleInfoContent(Module module)
    def String getIdentificationHelperFilename(Module module)
    def String getIdentificationHelperContent(Module module)
    def String getIdentificationModuleInfoFilename(Module module)
    def String getIdentificationModuleInfoContent(Module module)
    def String getVerifiyIdentificationFunctionalityFilename(Module module)
    def String getVerifiyIdentificationFunctionalityContent(Module module)
    def String getLimitedAccessHelperFilename(Module module)
    def String getLimitedAccessHelperContent(Module module)
    def String getLimitedAccessModuleInfoFilename(Module module)
    def String getLimitedAccessModuleInfoContent(Module module)
    def String getVerifiyEnableFunctionalityFilename(Module module)
    def String getVerifiyEnableFunctionalityContent(Module module)
    def String getEmailModuleFilename()
    def String getEmailModuleContent()
}