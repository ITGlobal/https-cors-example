# https-cors-example
Демонстрирует кросс-доменный запрос со страницы с доверенным SSL-сертификатом на локальный сервер.

Описание
--------
Имеем два самоподписанных сертификата SSL для домена localhost, полученных на http://www.selfsignedcertificate.com/: `localhost-1.crt`, `localhost-2.crt` с закрытыми ключами `localhost-1.key`, `localhost-2.key` соответственно.
NodeJS модуль `index.js` поднимает серверы https://localhost:8001 и https://localhost:8002 на сертификатах localhost-1 и localhost-2 соответственно.
Скрипт со страницы https://jsfiddle.net/dizel3d/af35y0t2/ с доверенным SSL-сертификатом выполняет кросс-доменные запросы на оба сервера.

Инструкция для OC Windows
----------
1. Установить NodeJS https://nodejs.org/
2. Выполнить `certmgr`, добавить `localhost-1.crt`, `localhost-2.crt` в раздел Trusted Root CA (Доверенные корневые CA).
3. Выполнить `node index.js`.
4. Перезапустить браузер, чтобы обновить кэш сертификатов. (Процесс Google Chrome может висеть в трее, его тоже нужно завершить.)
5. Открыть https://jsfiddle.net/dizel3d/af35y0t2/. На странице в области результата должны быть приветствия от ваших локальных серверов.
