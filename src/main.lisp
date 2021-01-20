(defpackage btc-price
  (:use :cl)
  (:export :get-price))
(in-package :btc-price)

(ql:quickload :drakma)
(ql:quickload :yason)

(defvar *api-url* "https://api1.binance.com/api/v3/ticker/24hr?symbol=BTCUSDT")
(defvar *key* "lastPrice")

(defun api-response ()
  "hit the api"
  (drakma:http-request *api-url* :decode-content t))

(defun decoded-response (response)
  (map 'string #'code-char response))

(defun parse-json (decoded-response)
  (yason:parse decoded-response :object-as :alist))

(defun extract-price (json)
  (cdr (assoc *key* json :test #'equal )))

(defun as-float (price)
  (read-from-string price))

(as-float (extract-price (parse-json (decoded-response (api-response)))))
