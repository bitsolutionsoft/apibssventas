interface Cliente {
  idcliente :number
  nombre    :string
  apellido  :string
  telefono  :number
  direccion :string
  sexo      :string
  nit       :string
  estado    :string
}

type NewCliente=Omit<Cliente, "idcliente">

interface DataCliente extends Cliente{
    factura: Factura []
}