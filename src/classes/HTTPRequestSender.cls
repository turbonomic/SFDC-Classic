global class HTTPRequestSender{

    @future (callout=true)
    Public static void sendHTTPRequest(String url, String body){
        Http http = new Http();
        HttpResponse res = new HttpResponse();
        HttpRequest req = new HttpRequest();
        req.setEndpoint(url);
        req.setBody(body);
        req.setMethod('POST');
        try {
            res = http.send(req);
        } catch(System.CalloutException e) {
            System.debug('CalloutException: '+ e);
            System.debug(res.toString());
        }
    }
}