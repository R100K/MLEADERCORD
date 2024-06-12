(princ (strcat "
				Author - Robert Stokłosa
				Available commands:
				MLEADERCORD - Inserts blocks with coordinates in the arrowhead of multileaders selected by a window
") )

(defun C:MLEADERCORD (/ mLeader mLeaderCord p1 p2 i n)
        (setvar "CMDECHO" 0) 
        (setvar "CMDDIA" 0) 
        (setvar "ATTDIA" 0)
        (prompt "\nSelect multileaders using a selection window")
        (setq p1 (getpoint "\nFirst corner: "))
        (setq p2 (getcorner p1 "\nSecond corner: "))
        (if (setq mLeaderList (ssget "W" p1 p2))
                (progn
                    (setq i 0
                        n (sslength mLeaderList)
                    )
                    (while (< i n)
                        (setq   mLeaderName (ssname mLeaderList i)
                                i (1+ i)
                        )

                        (setq 	mLeaderCord (list (cadr (assoc 110 (entget mLeaderName))) (caddr (assoc 110 (entget mLeaderName))))
                                mLeaderText (cdr (assoc 304 (entget mLeaderName)))
                        )
                        (command "-insert" "cordAtt" mLeaderCord "" "" "" mLeaderText)
                            
                    )           
                )
        )
	(princ)
)