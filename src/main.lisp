(defpackage btc-price
  (:use :cl :arrows :function-cache)
  (:export :btc-price-cached))
(in-package :btc-price)

(defparameter *api-url* "https://api1.binance.com/api/v3/ticker/24hr?symbol=BTCUSDT")
(defparameter *key* "lastPrice")
(defparameter *cache-timeout* 600)

(defun api-response ()
  (drakma:http-request *api-url* :decode-content t))

(defun decoded-response (response)
  (map 'string #'code-char response))

(defun parse-json (decoded-response)
  (yason:parse decoded-response :object-as :alist))

(defun extract-price (json)
  (cdr (assoc *key* json :test #'equal )))

(defun as-float (price)
  (read-from-string price))

(defun btc-price-now ()
  (-> (api-response)
      decoded-response
      parse-json
      extract-price
      as-float))

(defcached (btc-price-cached :timeout *cache-timeout*) ()
  (btc-price-now))
