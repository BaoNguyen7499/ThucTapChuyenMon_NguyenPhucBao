// Google Login
function onLoadFunction() {
    gapi.client.setApiKey('AIzaSyAihgpAI1StG7kROM8MeLtmMojTfDdSxAM');
    gapi.client.load('plus', 'v1', function () { });
}