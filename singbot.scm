(define-module (singbot)
    #:export
        (list-cmds)
        (send-cmd))

(use-modules (srfi srfi-1))
(use-modules (singbot perception)
             (singbot conversation)
             (singbot behavior))


(load-extension "libsingbot.so" "scm_init_binding")
(robot-init)

; XXX this is ugly!
;     put cmd codes in some json or xml file and load here
(define cmd-code (make-hash-table))
(hash-set! cmd-code "TURN_RIGHT" "128")
(hash-set! cmd-code "ARMR_UP" "129")
(hash-set! cmd-code "ARMR_OUT" "130")
(hash-set! cmd-code "TILT_RIGHT" "131")
(hash-set! cmd-code "ARMR_DOWN" "132")
(hash-set! cmd-code "ARMR_IN" "133")
(hash-set! cmd-code "WALK_FWD" "134")
(hash-set! cmd-code "WALK_BCK" "135")
(hash-set! cmd-code "TURN_LEFT" "136")
(hash-set! cmd-code "ARML_UP" "137")
(hash-set! cmd-code "ARML_OUT" "138")
(hash-set! cmd-code "TILT_LEFT" "139")
(hash-set! cmd-code "ARML_DOWN" "140")
(hash-set! cmd-code "ARML_IN" "141")
(hash-set! cmd-code "STOP" "142")
(hash-set! cmd-code "TURN_RIGHT_STEP" "160")
(hash-set! cmd-code "HAND_RIGHT_THUMP" "161")
(hash-set! cmd-code "HAND_RIGHT_THROW" "162")
(hash-set! cmd-code "SLEEP" "163")
(hash-set! cmd-code "HAND_RIGHT_PICKUP" "164")
(hash-set! cmd-code "LEAN_BCK" "165")
(hash-set! cmd-code "STEP_FWD" "166")
(hash-set! cmd-code "STEP_BCK" "167")
(hash-set! cmd-code "TURN_LEFT_STEP" "168")
(hash-set! cmd-code "HAND_LEFT_THUMP" "169")
(hash-set! cmd-code "HAND_LEFT_THROW" "170")
(hash-set! cmd-code "LISTEN" "171")
(hash-set! cmd-code "HAND_LEFT_PICKUP" "172")
(hash-set! cmd-code "LEAN_FWD" "173")
(hash-set! cmd-code "RESET" "174")
(hash-set! cmd-code "HAND_RIGHT_STRIKE3" "192")
(hash-set! cmd-code "HAND_RIGHT_SWEEP" "193")
(hash-set! cmd-code "BURP" "194")
(hash-set! cmd-code "HAND_RIGHT_STRIKE2" "195")
(hash-set! cmd-code "HIGH5" "196")
(hash-set! cmd-code "HAND_RIGHT_STRIKE1" "197")
(hash-set! cmd-code "BULLDOZER" "198")
(hash-set! cmd-code "OOPS" "199")
(hash-set! cmd-code "LEFT_HAND_STRIKE3" "200")
(hash-set! cmd-code "LEFT_HAND_SWEEP" "201")
(hash-set! cmd-code "WHISTLE" "202")
(hash-set! cmd-code "LEFT_HAND_STRIKE2" "203")
(hash-set! cmd-code "TALKBACK" "204")
(hash-set! cmd-code "LEFT_HAND_STRIKE1" "205")
(hash-set! cmd-code "ROAR" "206")
(hash-set! cmd-code "SHUFFLE" "246")
(hash-set! cmd-code "RAISE_THROW" "252")
(hash-set! cmd-code "KARATE_CHOP" "214")

(define (send-cmd cmd)
    (robot-cmd (hash-ref cmd-code cmd)))

