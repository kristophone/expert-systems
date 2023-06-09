;;definciión de reglas

(defrule mover-mesa
  ?estado <- (estado inicial) (mono en puerta) (mesa cerca de ventana)
    =>
  (retract ?estado) (assert (estado mesa-movida)) (assert (mono en mesa))
  (printout t "¡El mono movió la mesa!" crlf)
)

(defrule subir-mono
  ?estado <- (estado mesa-movida) (mono en mesa) (bananas colgando)
    =>
  (retract ?estado) (assert (estado mono-subido))
  (printout t "¡El mono está arriba de la mesa!" crlf)
)

(defrule tomar-bananas
  ?estado <- (estado mono-subido) (mono en mesa) (bananas colgando)
  =>
  (retract ?estado) (assert (estado bananas-agarradas))
  (printout t "¡El mono tomó las bananas!" crlf)
)

(defrule saltar-al-piso
  ?estado <- (estado bananas-agarradas) (mono en mesa)
  =>
  (retract ?estado) (assert (estado mono-en-piso) (mono en piso))
  (printout t "¡El mono saltó al piso!" crlf)
)

(defrule comer-bananas
  ?estado <- (estado mono-en-piso) (mono en piso)
  =>
  (retract ?estado)
  (printout t "¡El mono comío las bananas!" crlf)
)

;; base de conocimientos
(assert (estado inicial) (mono en puerta) (mesa cerca de ventana) (bananas colgando))

;; ejecutar spcript
(run)
