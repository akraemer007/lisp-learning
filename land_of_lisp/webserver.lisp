(defparameter my-socket (socket-server 4322))
(defparameter my-stream (socket-accept my-socket))
(defparameter my-stream (socket-connect 4322 "127.0.0.1"))
(print "Yo Server!" my-stream)
