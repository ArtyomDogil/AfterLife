public class T4_RestRequestForCurrentTime {
    public static HttpResponse makeGetCallout() {
        String areaAndLocation = '/Europe/Minsk';
        String requestEndpoint = 'http://worldtimeapi.org/api/timezone' + areaAndLocation;
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(requestEndpoint);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        String correctResponse = response.getBody().replace('"datetime"','"datetime2"');
        if (response.getStatusCode() == 200) {
            System.debug('correctResponse: ' + correctResponse);
            T4_JSON2ApexCurrentTime json2ApexCurrentTime = T4_JSON2ApexCurrentTime.parse(correctResponse);
            String datetime2 = json2ApexCurrentTime.datetime2;
            System.debug('datetime2 = ' + datetime2);
        }
        return response;
    }
}