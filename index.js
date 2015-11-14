var fs = require('fs');
var https = require('https');

function defineServer(certFileName, port) {
    var server = https.createServer({
        key: fs.readFileSync(certFileName + '.key', 'utf8'),
        cert: fs.readFileSync(certFileName + '.crt', 'utf8')
    }, function (req, res) {
        res.setHeader('Access-Control-Allow-Origin', '*');
        res.writeHead(200, {'Content-Type': 'text/plain'});
        res.end('Hello, I am your Local Server on https://localhost:' + port + '!\n');
    });
    server.listen(port, 'localhost');
}

defineServer('localhost-1', 8001);
defineServer('localhost-2', 8002);
