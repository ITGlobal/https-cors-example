var fs = require('fs');
var path = require('path');
var https = require('https');

function defineServer(certDir, port) {
    var server = https.createServer({
        pfx: fs.readFileSync(path.join(certDir, 'ssl.pfx'))
    }, function (req, res) {
        res.setHeader('Access-Control-Allow-Origin', '*');
        res.writeHead(200, {'Content-Type': 'text/plain'});
        res.end('Hello, I am your Local Server on https://localhost:' + port + '!\n');
    });
    server.listen(port, 'localhost');
    console.log('Listen https://localhost:' + port);
}

defineServer('ssl-1', 8001);
defineServer('ssl-2', 8002);
