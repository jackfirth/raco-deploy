#lang info
(define collection "raco-deploy")
(define deps '("base"))
(define build-deps '("scribble-lib" "racket-doc" "rackunit-lib"))
(define scribblings '(("scribblings/raco-deploy.scrbl" ())))
(define pkg-desc "Description Here")
(define version "0.0")
(define pkg-authors '(jackfirth))
(define license '(Apache-2.0 OR MIT))
(define raco-commands
  '("deploy"
    raco-deploy
    "deploy assets to external systems"
    50))
