@isTest
private class T4_RestRequestForCurrentTimeTest {

    @isTest static void testWithStaticResource() {
        StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
        mock.setStaticResource('T4_CalloutMockForCurrentTime');
        mock.setStatusCode(200);
        mock.setHeader('Content-Type', 'application/json;charset=UTF-8');

        Test.setMock(HttpCalloutMock.class, mock);
        HttpResponse result = T4_RestRequestForCurrentTime.makeGetCallout();

        System.assertNotEquals(null, result, 'The callout returned a null response.');
        System.assertEquals(200, result.getStatusCode(), 'The status code is not 200.');
        System.assertEquals('application/json;charset=UTF-8', result.getHeader('Content-Type'), 'The content type value is not expected.');
    }

    @isTest static void testWithoutStaticResource() {
        Test.setMock(HttpCalloutMock.class, new T4_TestWithoutStaticRes());
        HttpResponse response = T4_RestRequestForCurrentTime.makeGetCallout();

        String contentType = response.getHeader('Content-Type');
        System.assert(contentType == 'application/json');
        String actualValue = response.getBody();
        String expectedValue = '{"week_number":35,"utc_offset":"+03:00","utc_datetime":"2019-08-29T12:47:12.239954+00:00","unixtime":1567082832,"timezone":"Europe/Minsk","raw_offset":10800,"dst_until":null,"dst_offset":0,"dst_from":null,"dst":false,"day_of_year":241,"day_of_week":4,"datetime":"2019-08-29T15:47:12.239954+03:00","client_ip":"212.98.187.43","abbreviation":"+03"}';
        System.assertEquals(actualValue, expectedValue);
        System.assertEquals(200, response.getStatusCode());
    }

}