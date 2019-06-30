(define-module (versions)
  #:use-module (ice-9 binary-ports)
  #:use-module (ice-9 textual-ports)
  #:use-module (rnrs bytevectors)
  #:use-module (ice-9 match)
  #:use-module (ice-9 popen)
  #:use-module (srfi srfi-26)
  #:use-module (json parser)

  #:export
     (put-packages
      get-dependencies
      build-versions.dat))

(define* (put-int64 port x)
  (let ((vec (make-bytevector 8)))
    (bytevector-s64-set! vec 0 x (endianness big))
    (put-bytevector port vec)))

(define* (put-text port s)
  ; this should be utf8 length, utf8
  (put-int64 port (string-length s))
  (put-string port s))

(define* (put-version port v)
  (map (cut put-u8 port <>) v))

(define* (put-package port pkg)
  (match pkg
    ((author project version)
     (begin
       (put-text port author)
       (put-text port project)
       (put-int64 port 1)
       (put-version port version)))))

(define* (put-packages port pkgs)
  (put-int64 port (length pkgs)) ; total number of versions
  (put-int64 port (length pkgs)) ; number of packages
  (map
    (cut put-package port <>) 
    (sort pkgs (match-lambda*
                 (((auth1 proj1 _) (auth2 proj2 _))
                  (or (string<? auth1 auth2)
                      (and (string=? auth1 auth2)
                           (string<? proj1 proj2)))))))
  #t)

(define* (parse-version v)
  (map string->number (string-split v #\.)))

(define* (get-dependencies elm.json)
  (define* (add-dep name version deps)
    (cons
      (match (string-split name #\/)
        ((author project) (list author project (parse-version version))))
      deps))
  (define deps (hash-ref elm.json "dependencies"))
  (hash-fold
    add-dep
    (hash-fold add-dep '() (hash-ref deps "direct"))
    (hash-ref deps "indirect")))

(define* (build-versions.dat)
  (format #t "building versions.dat in ~a~%" (getcwd))
  (let ((packages (string-split
                    (get-line (open-input-pipe "echo */*/*"))
                    #\ )))
    (format #t "packages: ~a~%" packages)
    (put-packages
      (open-output-file "versions.dat")
      (map
        (lambda (path)
          (match (string-split path #\/)
            ((author project version)
             (list author project (parse-version version)))))
        packages))))
