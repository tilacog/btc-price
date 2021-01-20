(defpackage btc-price/tests/main
  (:use :cl
        :btc-price
        :rove))
(in-package :btc-price/tests/main)

;; NOTE: To run this test file, execute `(asdf:test-system :btc-price)' in your Lisp.

(deftest test-target-1
  (testing "should (= 1 1) to be true"
    (ok (= 1 1))))
