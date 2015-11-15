# https-cors-example
Демонстрирует кросс-доменный запрос со страницы с доверенным SSL-сертификатом на локальный сервер.

Описание
--------
Имеем два сертификата SSL для домена localhost, созданных с помощью `gencert.ps1`: `ssl-1\ssl.pfx` и `ssl-2\ssl.pfx`.
NodeJS модуль `index.js` поднимает серверы https://localhost:8001 и https://localhost:8002 на этих сертификатах соответственно.
Скрипт со страницы https://jsfiddle.net/dizel3d/af35y0t2/ с доверенным SSL-сертификатом выполняет кросс-доменные запросы на оба сервера.

Инструкция для OC Windows
----------
1. Установить NodeJS https://nodejs.org/
2. Запустить `node index.js`.
3. Легализовать сертификаты одним из способов:
  * Добавить корневые сертификаты `ssl-1\root.cer` и `ssl-2\root.cer` в раздел Trusted Root CA (Доверенные корневые CA) хранилища Windows. Это можно сделать вручную (`certmgr`) или автоматически (`regcerts.cmd`, требует PowerShell 3+).
  * Добавить серверы в исключения, перейдя по https://localhost:8001 и https://localhost:8002.
  * Добавить корневые сертификаты в хранилище браузера. (Например, Firefox не использует хранилище Windows, только свое.)
4. Перезапустить браузер, чтобы обновить кэш сертификатов. (Процесс Google Chrome может висеть в трее, его тоже нужно завершить.)
5. Открыть https://jsfiddle.net/dizel3d/af35y0t2/. На странице в области результата должны быть приветствия от ваших локальных серверов.

**Внимание!** п.3 можно пропустить, если сделать [суперфинт](http://stackoverflow.com/questions/6793174/third-party-signed-ssl-certificate-for-localhost-127-0-0-1/22258328#22258328):

1. Приобретаем сертификат SSL у известного CA для своего домена local.mysite.ru.
2. Прописываем в DNS local.mysite.ru = 127.0.0.1.
3. Запускаем локальный сервер на приобретенном SSL на порту 8001
4. Запросы к локальному серверу должны быть не по https://localhost:8001, а по https://local.mysite.ru:8001. Тогда проблем с сертификатом SSL не будет.
