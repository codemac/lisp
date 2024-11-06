(asdf:defsystem :codemac-lisp
  :author "Jeff Mickey <j@codemac.net>"
  :description "Jeff's monorepo of lisp stuff"
  :license "GPL" ; v3?
  :depends-on () ; stuff from vendor/ goes here
  :serial t ; make the components depend on eachother
  :components ((:file "package")
	       (:file "monte-carlo.lisp")))

(asdf:defsystem :codemac-lisp/t
  :description "Test suite for my lisp"
  :author "Jeff Mickey <j@codemac.net>"
  :license "GPL"
  :depends-on (:codemac-lisp)
  :serial t
  :components ((:file "package.test")
	       (:module "test"
		:serial t
		:components ((:file "tests"))))
  :perform (asdf:test-op (op system)
			 (funcall (read-from-string "codemac-lisp.test:run-tests"))))
