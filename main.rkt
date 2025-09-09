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


(define (package-catalog-entry #:asset-name asset-name
                               #:package-name package-name
                               #:published? published?
                               #:owner-email owner-email
                               #:extra-author-emails [extra-authors '()]
                               #:package-description [description ""]
                               #:package-tags [tags '()]
                               #:source-info package-source-info)
  (make-asset #:name asset-name
              #:state #false
              #:fetcher (λ () #false)
              #:actuator void))


(module+ main
  (command-line
    #:program (short-program+command-name)
    #:args ()
    (void)))


(module+ deploy
  (provide raco-deploy-package-catalog-entry)

  (define raco-deploy-package-catalog-entry
    (package-catalog-entry #:asset-name 'raco-deploy-package-catalog-entry
                           #:package-name "raco-deploy"
                           #:published? #false
                           #:owner-email "jackhfirth@gmail.com"
                           #:source-info #false)))
