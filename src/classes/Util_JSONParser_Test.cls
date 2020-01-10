/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an organization are executed whenever Apex code is deployed
 * to a production organization to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production organization. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the organization size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
@isTest
private class Util_JSONParser_Test {
    private static String testJson =    '{' +
                                        '    "firstName": "John",' +
                                        '    "lastName": "Smith",' +
                                        '    "age": 25,' +
                                        '    "address": {' +
                                        '        "streetAddress": "21 2nd Street",' +
                                        '        "city": "New York",' +
                                        '        "state": "NY",' +
                                        '        "postalCode": "10021"' +
                                        '    },' +
                                        '    "phoneNumber": [' +
                                        '        {' +
                                        '            "type": "home",' +
                                        '            "number": "212 555-1234"' +
                                        '        },' +
                                        '        {' +
                                        '             "type": "fax",' +
                                        '             "number": "646 555-4567"' +
                                        '        }' +
                                        '    ],' +
                                        '    "preferences": [' +
                                        '        "cheese", ' +
                                        '        "milk", ' +
                                        '        "ham"' +
                                        '    ],' +
                                        '    "friends": [' +
                                        '        "James",' +
                                        '        {' +
                                        '            "Name": "Jimmy"' +
                                        '        }' +
                                        '    ],' +
                                        '    "isAlive": true,' +
                                        '    "partner": null,' +
                                        '    "size": 107.5' +
                                        '}';
    
    static testMethod void GetTopLevelStringValue_ReturnsStringValue() {
        Util_JSONParser parser = Util_JSONParser.createParser(testJson);
        String result = parser.get('firstName').Value;
        System.assertEquals('John', result);
    }
    
    static testMethod void GetSecondLevelStringValue_ReturnsStringValue() {
        Util_JSONParser parser = Util_JSONParser.createParser(testJson);
        String result = parser.get('address').get('state').Value;
        System.assertEquals('NY', result);
    }
    
    static testMethod void GetIntegerValue_ReturnsStringValue() {
        Util_JSONParser parser = Util_JSONParser.createParser(testJson);
        String result = parser.get('age').Value;
        System.assertEquals('25', result);
    }
    
    static testMethod void GetFloatValue_ReturnsStringValue() {
        Util_JSONParser parser = Util_JSONParser.createParser(testJson);
        String result = parser.get('size').Value;
        System.assertEquals('107.5', result);
    }
    
    static testMethod void GetBooleanValue_ReturnsStringValue() {
        Util_JSONParser parser = Util_JSONParser.createParser(testJson);
        String result = parser.get('isAlive').Value;
        System.assertEquals('true', result);
    }
    
    static testMethod void GetNullValue_ReturnsStringValue() {
        Util_JSONParser parser = Util_JSONParser.createParser(testJson);
        String result = parser.get('partner').Value;
        System.assertEquals('null', result);
    }
    
    static testMethod void GetObject_ReturnsObject() {
        String expectedObjectString = '{"streetAddress":"21 2nd Street","city":"New York","state":"NY","postalCode":"10021"}';
        Util_JSONParser parser = Util_JSONParser.createParser(testJson);
        String result = parser.get('address').Value;
        System.assertEquals(expectedObjectString, result);
    }
    
    static testMethod void GetObjectArray_ReturnsArray() {
        String expectedArrayString = '[{"type":"home","number":"212 555-1234"},{"type":"fax","number":"646 555-4567"}]';
        Util_JSONParser parser = Util_JSONParser.createParser(testJson);
        String result = parser.get('phoneNumber').Value;
        System.assertEquals(expectedArrayString, result);
    }
    
    static testMethod void GetMixedValueArray_ReturnsArray() {
        String expectedArrayString = '["James",{"Name":"Jimmy"}]';
        Util_JSONParser parser = Util_JSONParser.createParser(testJson);
        String result = parser.get('friends').Value;
        System.assertEquals(expectedArrayString, result);
    }
    
    static testMethod void ParseObjectArray_ReturnsListOfTwoParsers() {
        Util_JSONParser parser = Util_JSONParser.createParser(testJson);
        String jsonArray = parser.get('phoneNumber').Value;
        List<Util_JSONParser> parsers = Util_JSONParser.parseArray(jsonArray);
        System.assertNotEquals(null, parsers);
        System.assertEquals(2, parsers.size());
    }
    
    static testMethod void ParseMixedArray_ReturnsNull() {
        Util_JSONParser parser = Util_JSONParser.createParser(testJson);
        String jsonArray = parser.get('friends').Value;
        List<Util_JSONParser> parsers = Util_JSONParser.parseArray(jsonArray);
        System.assertEquals(null, parsers);
    }
    
    static testMethod void ParseNonArray_ReturnsNull() {
        List<Util_JSONParser> parsers = Util_JSONParser.parseArray(testJson);
        System.assertEquals(null, parsers);
    }
}