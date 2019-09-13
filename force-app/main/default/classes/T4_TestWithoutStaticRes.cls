@isTest
global class T4_TestWithoutStaticRes implements HttpCalloutMock {
    global HTTPResponse respond(HTTPRequest request) {

        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        response.setBody('{"week_number":35,"utc_offset":"+03:00","utc_datetime":"2019-08-29T12:47:12.239954+00:00","unixtime":1567082832,"timezone":"Europe/Minsk","raw_offset":10800,"dst_until":null,"dst_offset":0,"dst_from":null,"dst":false,"day_of_year":241,"day_of_week":4,"datetime":"2019-08-29T15:47:12.239954+03:00","client_ip":"212.98.187.43","abbreviation":"+03"}');
        response.setStatusCode(200);
        return response;
    }

}