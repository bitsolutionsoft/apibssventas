 interface Empleado{
 idempleado : number
  nombre    :string
  apellido  :string
  direccion :string
  dpi       :string
  telefono  :number
  estado    :string
  roles     :string
 }

 type EmpleadoInsert=Omit<Empleado,"idempleado">
 interface EmpleadoData extends Empleado{
     permiso    :Permiso[]
  usuario    :Usuario[]
 }
 