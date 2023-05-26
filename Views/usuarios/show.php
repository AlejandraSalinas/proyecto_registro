<?php
include_once dirname(__FILE__) . '../../../config/config.php';
include_once ("../Main/partials/header.php");
require_once '../../models/tipoIdentificacionModel.php';
require_once '../../models/RolesModel.php';
require_once '../../models/SexoModel.php';
require_once '../../models/PersonaModel.php';

$datos = new PersonaModel();
$registro = $datos->getById($_REQUEST['id_persona']);

$datos_identificacion = new TipoIdentificacionModel();
$registro_identificacion = $datos_identificacion->getAll();

$datos_rol  = new RolesModel();
$data  = $datos_rol->getAll();

// $datos_documento = new TipoDocumento();
// $registros = $datos_documento->getAll();

$datos_sexo = new SexoModel();
$genero = $datos_sexo->getAll();

foreach ($registro as $persona) {
    $id_persona            = $persona->getId();
    $tipo_identificacion   = $persona->getTipoIdentificacion();
    $numero_identificacion = $persona->getNumeroIdentificacion();
    $primer_nombre         = $persona->getPrimerNombre();
    $segundo_nombre        = $persona->getSegundoNombre();
    $primer_apellido       = $persona->getPrimerApellido();
    $segundo_apellido      = $persona->getSegundoApellido();
    $email                 = $persona->getEmail();
    $telefono              = $persona->getTelefono();
    $direccion             = $persona->getDireccion();
    $id_sexo               = $persona->getSexo();
    $id_rol                = $persona->getRol();
}
?>
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-4 text-gray-800">Ver usuarios</h1>
    <hr class="hr mb-5">
    <form method="post">
        <!-- <input type="hidden" name="id" value="2"> -->
        <input type="hidden" name="id" value="<?= $id_persona ?>">
        <div class="container">
            <div class="row">
                <div class="mb-4 col-6">
                    <label for="tipo_identificacion" class="form-label">Tipo de Identificación:</label>
                    <select class="form-select" value="<?= $tipo_identificacion ?>" id="id_tipo_identificacion" name="id_tipo_identificacion" disabled>
                        <?php
                        foreach ($registro_identificacion  as $datos) {
                            echo '<option value="' . $datos->getId() . '">' . $datos->getTipoIdentificacion() . '</option>';
                        }
                        ?>
                    </select>
                </div>
                <div class="col-6 mb-4">
                    <label for="numero_identificacion" class="form-label">Número de Identificación:</label>
                    <input type="number" class="form-control" value="<?= $numero_identificacion ?>" id="numero_identificacion" name="numero_identificacion">
                </div>
                <div class="mb-4 col-6">
                    <label for="primer_nombre" class="form-label">Primer Nombre:</label>
                    <input type="text" class="form-control" value="<?= $primer_nombre ?>" name="primer_nombre" id="primer_nombre" >
                </div>
                <div class="col-6 mb-4">
                    <label for="segundo_nombre" class="form-label">Segundo Nombre:</label>
                    <input type="text" class="form-control" value="<?= $segundo_nombre ?>" name="segundo_nombre" id="segundo_nombre">
                </div>
                <div class="mb-4 col-6">
                    <label for="primer_apellido" class="form-label">Primer Apellido:</label>
                    <input type="text" class="form-control" value="<?= $primer_apellido ?>" name="primer_apellido" id="primer_apellido">
                </div>
                <div class="col-6 mb-4">
                    <label for="segundo_apellido" class="form-label">Segundo Apellido:</label>
                    <input type="text" class="form-control" value="<?= $segundo_apellido ?>" name="segundo_apellido" id="segundo_apellido" >
                </div>
                <div class="mb-4 col-6">
                    <label for="email" class="form-label">Email:</label>
                    <input type="email" class="form-control" value="<?= $email ?>" name="email" id="email">
                </div>
                <div class="col-3 mb-4">
                    <label for="telefono" class="form-label">Teléfono:</label>
                    <input type="number" class="form-control" value="<?= $telefono   ?>" id="telefono" name="telefono">
                </div>
                <div class="col-3 mb-4">
                    <label for="direccion" class="form-label">Dirección:</label>
                    <input type="text" class="form-control" value="<?= $direccion ?>" id="direccion" name="direccion">
                </div>
                <div class="mb-4 col-6">
                    <label for="id_sexo" class="form-label">Sexo:</label>
                    <select class="form-select" value="<?= $id_sexo ?>" id="id_sexo" name="id_sexo" disabled>
                        <?php
                        foreach ($genero  as $sexo_persona) {
                            echo '<option value="' . $sexo_persona->getId() . '">' . $sexo_persona->getSexo() . '</option>';
                        }
                        ?>
                    </select>
                </div>
                <div class="col-6 mb-2">
                    <label for="id_rol" class="form-label">Rol:</label>
                    <select class="form-select" value="<?= $id_rol ?>" id="id_rol" name="id_rol" disabled>
                        <?php
                        foreach ($data  as $datos) {
                            echo '<option value="' . $datos->getId() . '">' . $datos->getRoles() . '</option>';
                        }
                        ?>
                    </select>
                </div>
                <div class="row justify-content-center">
                    <div class="col-2">
                        <a class="btn btn-outline-success"  href="index.php">Regresar a Inicio</a>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
<?php require_once("../Main/partials/footer.php"); ?>