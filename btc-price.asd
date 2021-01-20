(defsystem "btc-price"
  :version "0.1.0"
  :author ""
  :license ""
  :depends-on ("drakma" "yason" "arrows")
  :components ((:module "src"
                :components
                ((:file "main"))))
  :description ""
  :in-order-to ((test-op (test-op "btc-price/tests"))))

(defsystem "btc-price/tests"
  :author ""
  :license ""
  :depends-on ("btc-price"
               "rove")
  :components ((:module "tests"
                :components
                ((:file "main"))))
  :description "Test system for btc-price"
  :perform (test-op (op c) (symbol-call :rove :run c)))
