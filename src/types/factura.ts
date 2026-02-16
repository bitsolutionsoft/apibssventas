 interface Factura{
  idfactura        :number
  idcliente        :number
  fecha            :string
  estado           :string  
  motivo_anulacion :string
  total            :number
  idempleado       :number
  idvendedor       :number
 }

 type NewFactura=Omit<Factura, "idfactura">
