;nyquist plug-in
;version 1
;type process
;name "AM modulace 2"
;action "AM modulace 2"
;author "Martin Zachrdla"

;control freq "Nosna frekvence" real "Hz" 0.1 0.01 20000.00
;control filtr "Filtr frekvence" real "Hz" 0.1 0.01 20000.00

(sim (mult (lowpass8 s filtr) -0.5)
    (mult 
        (sum 0.5
            (hzosc freq)
        )
        (lowpass8 s filtr)
    )
)