#lang racket/base


(require rebellion/custom-write)


(module+ main
  (require raco/command-name
           racket/cmdline))


;@----------------------------------------------------------------------------------------------------


(struct asset (name state fetcher actuator)
  #:omit-define-syntaxes
  #:constructor-name constructor:asset
  #:property prop:object-name (struct-field-index name)
  #:property prop:custom-write (make-named-object-custom-write 'asset))


(define (make-asset #:name name #:state state #:fetcher fetcher #:actuator actuator)
  (constructor:asset name state fetcher actuator))


(module+ main
  (command-line
    #:program (short-program+command-name)
    #:args ()
    (void)))


(module+ deploy
  (provide raco-deploy-package-catalog-entry)

  (define raco-deploy-package-catalog-entry
    (make-asset #:name 'raco-deploy-package-catalog-entry
                #:state #false
                #:fetcher (λ () #false)
                #:actuator void)))
