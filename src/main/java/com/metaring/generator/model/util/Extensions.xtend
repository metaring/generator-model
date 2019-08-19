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

package com.metaring.generator.model.util

import java.util.HashMap
import java.util.Map
import com.metaring.generator.model.data.Attribute

final class Extensions {

    public static final String DEFAULT_PACKAGE_NAME = "com.metaring.framework"

    public static val NAME_TEXT = "Text"
    public static val String NAME_DIGIT = "Digit"
    public static val String NAME_REAL_DIGIT = "RealDigit"
    public static val String NAME_TRUTH = "Truth"
    public static val String NAME_EMAIL = "Email"
    public static val String NAME_UNKNOWN = "Unknown"

    static val TYPE_UNKNOWN = "DataRepresentation"

    static def combineWithSystemNamespace(String n) {
        var name = n
        if (name.startsWith('.')) {
            name = name.substring(1)
        }
        if (name.endsWith('.')) {
            name = name.substring(0, name.length - 1)
        }
        DEFAULT_PACKAGE_NAME + "." + name
    }

    static val Map<String, String> NAME_TYPE_MAPPING = {
        var map = new HashMap<String, String>
        map.put(NAME_UNKNOWN, TYPE_UNKNOWN)
        map
    }

    static final def isNullOrEmpty(String s) {
        s === null || s.empty
    }

    static final def isNullOrWhiteSpace(String s) {
        s === null || s.trim().empty
    }

    static final def getPlural(String word) {
        var plural = ""
        if (!word.isNullOrWhiteSpace) {
            plural = "s"
            if (word.toLowerCase().endsWith("y")) {
                plural = word.substring(0, word.length - 1) + "ies"
            } else {
                plural = word + plural
            }
        }
        plural
    }

    static final def toStaticFieldNameForTools(String w) {
        var word = w.toStaticFieldName
        for(String key : NAME_TYPE_MAPPING.keySet()) {
            if(word.equals(key.toStaticFieldName)) {
                return NAME_TYPE_MAPPING.get(key).toStaticFieldName
            }
        }
        word
    }

    static final def toStaticFieldName(String word) {
        if (word.isNullOrWhiteSpace) {
            return ""
        }
        var stringBuilder = new StringBuilder()
        var digit = false
        var lastIsUpper = false
        for (var i = 0; i < word.length(); i++) {
            var c = word.charAt(i)
            if (i > 0) {
                if (Character.isDigit(c)) {
                    if (!digit) {
                        stringBuilder.append("_")
                        digit = true
                    }
                } else {
                    digit = false
                    if (Character.isUpperCase(c)) {
                        if (!lastIsUpper) {
                            lastIsUpper = true
                            if (!stringBuilder.toString().endsWith("_")) {
                                stringBuilder.append("_")
                            }
                        }
                    } else {
                        lastIsUpper = false
                    }
                }
            } else if (Character.isUpperCase(c)) {
                lastIsUpper = true
            }
            stringBuilder.append(c)
        }
        var staticFieldName = stringBuilder.toString()
        staticFieldName = staticFieldName.toUpperCase()
    }

    private static final def isSingleNative(Attribute attribute, String name) {
        attribute !== null
                && attribute.isNative()
                && !attribute.isMany()
                && attribute.getName().equalsIgnoreCase(name)
    }

    private static final def isManyNative(Attribute attribute, String name) {
        attribute !== null
                && attribute.isNative()
                && attribute.isMany()
                && attribute.getName().equalsIgnoreCase(name)
    }

    private static final def isNative(Attribute attribute, String name) {
        attribute !== null
                && attribute.isNative()
                && attribute.getName().equalsIgnoreCase(name)
    }

     static final def isUnknown(Attribute attribute) {
        attribute.isNative(NAME_UNKNOWN)
    }

     static final def isText(Attribute attribute) {
        attribute.isNative(NAME_TEXT)
    }

     static final def isDigit(Attribute attribute) {
        attribute.isNative(NAME_DIGIT)
    }

     static final def isRealDigit(Attribute attribute) {
        attribute.isNative(NAME_REAL_DIGIT)
    }

     static final def isTruth(Attribute attribute) {
        attribute.isNative(NAME_TRUTH)
    }

     static final def isEmail(Attribute attribute) {
        attribute.isNative(NAME_EMAIL)
    }

     static final def isSingleText(Attribute attribute) {
        attribute.isSingleNative(NAME_TEXT)
    }

     static final def isSingleDigit(Attribute attribute) {
        attribute.isSingleNative(NAME_DIGIT)
    }

     static final def isSingleRealDigit(Attribute attribute) {
        attribute.isSingleNative(NAME_REAL_DIGIT)
    }

     static final def isSingleTruth(Attribute attribute) {
        attribute.isSingleNative(NAME_TRUTH)
    }

     static final def isSingleEmail(Attribute attribute) {
        attribute.isSingleNative(NAME_EMAIL)
    }

     static final def isManyText(Attribute attribute) {
        attribute.isManyNative(NAME_TEXT)
    }

     static final def isManyDigit(Attribute attribute) {
        attribute.isManyNative(NAME_DIGIT)
    }

     static final def isManyRealDigit(Attribute attribute) {
        attribute.isManyNative(NAME_REAL_DIGIT)
    }

     static final def isManyTruth(Attribute attribute) {
        attribute.isManyNative(NAME_TRUTH)
    }

     static final def isManyEmail(Attribute attribute) {
        attribute.isManyNative(NAME_EMAIL)
    }
}