;nyquist plug-in
;version 1
;type process
;name "AM modulace 1"
;action "AM modulace 1
;author "Martin Zachrdla"

;control freq "Nosna frekvence" real "Hz" 0.1 0.01 20000.00
;control vlna "Vlna" choice "sinus,trojuhelnik,pila,obdelnik,sum" 0
;control vyber "Omezit nosnou frekvenci" choice "Ano,Ne" 1

(setq typ 0)

(cond 
	((= vlna 0)
        (setq typ (hzosc freq))
    )
    ((= vlna 1)
	    (setq typ (osc-tri freq))
    )
    ((= vlna 2)
        (setq typ (osc-saw freq))
    )
    ((= vlna 3)
	    (setq typ (osc-pulse freq 0.25))
    )
    ((= vlna 4)
	    (setq typ (noise))
    )    
)



(cond 
	((= vyber 0)
       (mult (sum 0.5 (scale 0.5 s)) typ)
    )
    ((= vyber 1)
	   (mult (sum 0.5 (scale 0.5 typ)) s)
    )
)