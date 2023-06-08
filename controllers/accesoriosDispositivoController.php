<?php
require_once  '../models/accesoriosDispositivoModel.php';

$controllersDispositivo = new accesoriosDispositivoController;

class accesoriosDispositivoController{
    private $accesorios_dispositivo;

    public function __construct(){
        $this->accesorios_dispositivo = new AccesoriosDispositivoModel();

        if (isset($_REQUEST['c'])) {
            switch ($_REQUEST['c']) {
                case 1: //Almacenar en la base de datos
                    self::store();
                    break;
                case '2': //ver usuario
                    self::show();
                    break;
                case '3': //Actualizar el registro
                    self::update();
                    break;
                case '4': //eliminar el registro
                    self::delete();
                    break;
                default:
                    self::index();
                    break;
            }
        }
    }
    public function index()
    {
        return $this->accesorios_dispositivo->getAll();
    }
    public function store()
    {
        $datos = [
            'nombre'   => $_REQUEST['nombre']
        ];

        $result = $this->accesorios_dispositivo->store($datos);

        if ($result) {
            //header("Location: ../Views/tipoDispositivoC/index.php");
            exit();
        }

        return $result;
    }
    public function show()
    {
        $id_accesorios = $_REQUEST['id_accesorios'];
        header("Location: ../Views/dispositivos/show.php?id_accesorios=" . $id_accesorios);
    }
    public function delete()
    {
        $this->accesorios_dispositivo->delete($_REQUEST['id_accesorios ']);
        //header("Location: ../Views/tipoIdentificaion/index.php");
    }
    public function update()
    {
        $datos = [
            'id_accesorios ' => $_REQUEST['id_accesorios '],
            'nombre' => $_REQUEST['nombre']
        ];
        $result = $this->accesorios_dispositivo->update($datos);

        if ($result) {
            echo json_encode(array('succes' => 1, 'nombre' => $datos['nombre']));
        }
    }
}