<?php
require_once dirname(__FILE__) . '../../../config/config.php';
require_once("../Main/partials/header.php");
require_once '../../models/tipoIdentificacionModel.php';
require_once '../../models/RolesModel.php';
require_once '../../models/SexoModel.php';

$datos_identificacion = new TipoIdentificacionModel();
$registro_identificacion = $datos_identificacion->getAll();

$datos_rol  = new RolesModel();
$data  = $datos_rol->getAll();

$datos_sexo = new SexoModel();
$genero = $datos_sexo->getAll();

?>

<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-4 text-gray-800">Crear Usuario</h1>
    <hr class="hr mb-5">
    <form action="../../controllers/PersonaController.php" method="post">
        <input type="hidden" name="c" value="1">
        <div class="container">
            <div class="row">
                <div class="mb-4 col-6">
                    <label for="tipo_identificacion" class="form-label">Tipo de Identificación:</label>
                    <select class="form-select" id="tipo_identificacion" name="tipo_identificacion" required="required">
                        <option selected>Seleccionar</option>
                        <?php
                        foreach ($registro_identificacion  as $datos) {
                            echo '<option value="' . $datos->getId() . '">' . $datos->getTipoIdentificacion() . '</option>';
                        }
                        ?>
                    </select>
                </div>
                <div class="col-6 mb-4">
                    <label for="numero_identificacion" class="form-label">Número de Identificación:</label>
                    <input type="number" class="form-control"  id="numero_identificacion" name="numero_identificacion" oninput="limitarDigitos(numero_identificacion)" required="required">
                </div>
                <div class="mb-4 col-3">
                    <label for="primer_nombre" class="form-label">Primer Nombre:</label>
                    <input type="text" class="form-control" name="primer_nombre" id="primer_nombre"  required>
                </div>
                <div class="col-3 mb-4">
                    <label for="segundo_nombre" class="form-label">Segundo Nombre:</label>
                    <input type="text" class="form-control" name="segundo_nombre"  id="segundo_nombre">
                </div>
                <div class="mb-4 col-3">
                    <label for="primer_apellido" class="form-label">Primer Apellido:</label>
                    <input type="text" class="form-control" name="primer_apellido" id="primer_apellido" required>
                </div>
                <div class="col-3 mb-4">
                    <label for="segundo_apellido" class="form-label">Segundo Apellido:</label>
                    <input type="text" class="form-control" name="segundo_apellido" id="segundo_apellido">
                </div>
                <div class="mb-4 col-6">
                    <label for="email" class="form-label">Email:</label>
                    <input type="email" class="form-control" name="email" id="email">
                </div>
                <div class="col-3 mb-4">
                    <label for="telefono" class="form-label">Teléfono:</label>
                    <input type="number" class="form-control" id="telefono" name="telefono" oninput="limitarDigitos(telefono)">
                </div>
                <div class="col-3 mb-4">
                    <label for="direccion" class="form-label">Dirección:</label>
                    <input type="text" class="form-control" id="direccion" name="direccion">
                </div>
                <div class="mb-4 col-6">
                    <label for="id_sexo" class="form-label">Sexo:</label>
                    <select class="form-select" id="id_sexo" name="id_sexo" required="required">
                    <option selected>Seleccionar</option>
                    <?php
                    foreach ($genero  as $sexo) {
                        echo '<option value="' . $sexo->getId() . '">' . $sexo->getSexo() . '</option>';
                    }
                    ?>
                    </select>
                </div>
                <div class="col-6 mb-2">
                    <label for="id_rol" class="form-label">Rol:</label>
                    <select class="form-select" id="id_rol" name="id_rol" required="required">
                        <option selected>Seleccionar</option>
                        <?php
                            foreach ($data  as $datos) {
                                echo '<option value="' . $datos->getId() . '">' . $datos->getRoles() . '</option>';
                            }
                        ?>
                    </select>
                </div>
                <div class="row justify-content-center">
                    <div class="col-3 mb-2">
                        <button type="submit" class="btn btn-primary">Guardar</button>
                                     
                        <a class="btn btn-success"  href="../Main/index.php">Regresar a Inicio</a>
                    </div>    
                </div>
            </div>  
        </div>        
    </form>
</div>
<script>
    function limitarDigitos(numero_identificacion) {
        if (numero_identificacion.value.length > 10) {
            numero_identificacion.value = numero_identificacion.value.slice(0, 10); // Corta el valor a los primeros diez dígitos
        }
    }
    function limitarDigitos(telefono) {
        if (telefono.value.length > 10) {
            telefono.value = telefono.value.slice(0, 10); // Corta el valor a los primeros diez dígitos
        }
    }
    const inputs = document.querySelectorAll('#primer_nombre, #segundo_nombre, #primer_apellido, #segundo_apellido');

    inputs.forEach(function(input) {
    input.addEventListener('input', function(event) {
      const value = input.value;
      input.value = value.replace(/[0-9]/g, '').replace(/[^a-zA-Z]/g, '');
    });
  });

</script>
<?php require_once("../Main/partials/footer.php"); ?>